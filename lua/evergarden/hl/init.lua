local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups.OL
function M.setup(theme, config)
  ---@type evergarden.types.hlgroups.OL
  local hl_groups = {}

  local function load_hl(module_base, lst)
    local overlays = vim
      .iter(ipairs(lst))
      :map(function(_, mod)
        local mod_path = module_base:format(mod)
        local ok, result = pcall(require, mod_path)
        if not ok then
          return error(
            string.format('could not import hl groups from %s', mod_path)
          )
        end

        ---@type fun(theme, config): evergarden.types.hlgroups.OL
        local cb
        if type(result) == 'table' then
          if result.get and type(result.get) == 'function' then
            cb = result.get
          else
            return result
          end
        elseif type(result) == 'function' then
          cb = result
        end

        ---@diagnostic disable-next-line: redefined-local
        local ok, result = pcall(cb, theme, config)
        if not ok then
          return
        end
        return result
      end)
      :totable()
    table.insert(hl_groups, overlays)
  end

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

  table.insert(hl_groups, accents)

  load_hl(
    'evergarden.hl.%s',
    { 'editor', 'syntax', 'treesitter', 'diagnostics' }
  )
  load_hl('evergarden.hl.ft.%s', {
    'lua',
    'html',
    'css',
    'help',
    'markdown',
    'rust',
    'typescript',
  })

  load_hl(
    'evergarden.hl.integrations.%s',
    vim
      .iter(pairs(config.integrations))
      :filter(function(_, props)
        return (type(props) == 'table' and props.enable)
          or (type(props) == 'boolean' and props)
      end)
      :map(function(name, _)
        return name
      end)
      :totable()
  )

  if config.override_terminal then
    require 'evergarden.hl.terminal'(theme, theme.colors)
  end

  local overrides = config.overrides or {}
  if type(overrides) == 'function' then
    overrides = overrides(theme.colors) --[[@as evergarden.types.hlgroups.OL]]
  end
  table.insert(hl_groups, overrides)

  return hl_groups
end

return M
