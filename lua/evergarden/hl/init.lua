local M = {}

---@alias evergarden.types.colorspec { fg?: string, bg?: string, [1]: string, [2]: string, link: string, reverse: boolean }
---@alias evergarden.types.hlgroups { [string]: evergarden.types.colorspec }

---@param theme evergarden.types.theme
---@param config evergarden.types.config
function M.setup(theme, config)
  ---@type evergarden.types.hlgroups
  local hl_groups = {}

  local accents = {
    RedAccent = { theme.red, '#453539' },
    OrangeAccent = { theme.orange, '#4A453E' },
    YellowAccent = { theme.yellow, '#4A4941' },
    GreenAccent = { theme.green, '#384239' },
    AquaAccent = { theme.aqua, '#344240' },
    SkyeAccent = { theme.skye, '#313F42' },
    BlueAccent = { theme.blue, '#363A47' },
    PurpleAccent = { theme.purple, '#43374A' },
    PinkAccent = { theme.pink, '#453547' },
  }

  hl_groups = vim.tbl_extend('force', hl_groups, accents)

  vim
    .iter(ipairs { 'editor', 'syntax', 'treesitter', 'diagnostics' })
    :each(function(_, mod)
      local ok, hl_fn = pcall(require, ('evergarden.hl.%s'):format(mod))
      if not ok then
        return
      end
      ---@diagnostic disable-next-line: redefined-local
      local ok, hl_imports = pcall(hl_fn, theme, config)
      if not ok then
        return
      end
      hl_groups = vim.tbl_extend('force', hl_groups, hl_imports)
    end)

  vim
    .iter(ipairs {
      'lua',
      'html',
      'scss',
      'help',
      'markdown',
      'rust',
      'typescript',
    })
    :each(function(_, ft)
      local ok, hl_ft_fn = pcall(require, ('evergarden.hl.ft.%s'):format(ft))
      if not ok then
        return
      end
      ---@diagnostic disable-next-line: redefined-local
      local ok, hl_imports = pcall(hl_ft_fn, theme, config)
      if not ok then
        return
      end
      hl_groups = vim.tbl_extend('force', hl_groups, hl_imports)
    end)

  local load_integration = function(name)
    local ok, mod =
      pcall(require, string.format('evergarden.hl.integrations.%s', name))
    if ok then
      hl_groups = vim.tbl_extend('force', hl_groups, mod.get(theme, config))
    end
  end
  for name, props in pairs(config.integrations) do
    if
      (type(props) == 'table' and props.enable)
      or (type(props) == 'boolean' and props)
    then
      load_integration(name)
    end
  end

  if config.override_terminal then
    require 'evergarden.hl.terminal'(theme, theme.colors)
  end

  for hl, override in pairs(config.overrides or {}) do
    if hl_groups[hl] and not vim.tbl_isempty(override) then
      hl_groups[hl].link = nil
    end
    hl_groups[hl] = vim.tbl_deep_extend('force', hl_groups[hl] or {}, override)
  end

  return hl_groups
end

return M
