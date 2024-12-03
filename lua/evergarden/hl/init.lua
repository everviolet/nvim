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

  -- Telescope
  hl_groups['TelescopeNormal'] = { theme.syntax.context }
  -- hl_groups['TelescopeNormal'] = { link = 'Normal' }
  hl_groups['TelescopePromptPrefix'] = { link = 'Constant' }
  hl_groups['TelescopePromptNormal'] = { 'none', 'none' }
  hl_groups['TelescopeSelection'] = { link = 'Identifier' }
  hl_groups['TelescopeSelection'] = { 'none', theme.surface0 }
  hl_groups['TelescopeSelectionCaret'] = { link = 'TelescopeNormal' }
  hl_groups['TelescopeMatching'] = { link = 'Search' }
  hl_groups['TelescopeMatching'] = { link = 'Search' }
  hl_groups['TelescopeTitle'] = { link = 'FloatTitle' }
  hl_groups['TelescopeBorder'] = { link = 'FloatBorder' }

  hl_groups['TelescopePromptBorder'] = { link = 'TelescopeBorder' }
  hl_groups['TelescopeResultsBorder'] = { link = 'TelescopeBorder' }
  hl_groups['TelescopePreviewBorder'] = { link = 'TelescopeBorder' }

  -- GitSigns
  hl_groups['GitGutterAdd'] = { theme.diff.add, theme.sign }
  hl_groups['GitGutterChange'] = { theme.diff.change, theme.sign }
  hl_groups['GitGutterDelete'] = { theme.diff.delete, theme.sign }
  hl_groups['GitGutterChangeDelete'] = { link = 'GitGutterChange' }

  -- Cmp
  hl_groups['CmpItemMenu'] = { theme.syntax.constant, italic = true }

  hl_groups['CmpItemKindText'] = { theme.text }
  hl_groups['CmpItemKindMethod'] = { theme.syntax.constant }
  hl_groups['CmpItemKindFunction'] = { theme.syntax.call }
  hl_groups['CmpItemKindConstructor'] = { theme.syntax.type }
  hl_groups['CmpItemKindField'] = { theme.syntax.object }
  hl_groups['CmpItemKindVariable'] = { theme.syntax.object }
  hl_groups['CmpItemKindClass'] = { theme.syntax.type }
  hl_groups['CmpItemKindInterface'] = { theme.syntax.type }
  hl_groups['CmpItemKindModule'] = { theme.syntax.keyword }
  hl_groups['CmpItemKindProperty'] = { theme.syntax.keyword }
  hl_groups['CmpItemKindUnit'] = { theme.syntax.constant }
  hl_groups['CmpItemKindValue'] = { theme.syntax.constant }
  hl_groups['CmpItemKindEnum'] = { theme.syntax.constant }
  hl_groups['CmpItemKindKeyword'] = { theme.syntax.keyword }
  hl_groups['CmpItemKindSnippet'] = { theme.syntax.macro }
  hl_groups['CmpItemKindColor'] = { theme.syntax.constant }
  hl_groups['CmpItemKindFile'] = { theme.syntax.type }
  hl_groups['CmpItemKindReference'] = { theme.syntax.context }
  hl_groups['CmpItemKindFolder'] = { theme.syntax.type }
  hl_groups['CmpItemKindEnumMember'] = { theme.syntax.constant }
  hl_groups['CmpItemKindConstant'] = { theme.syntax.constant }
  hl_groups['CmpItemKindStruct'] = { theme.syntax.type }
  hl_groups['CmpItemKindEvent'] = { theme.syntax.keyword }
  hl_groups['CmpItemKindOperator'] = { link = 'Operator' }
  hl_groups['CmpItemKindTypeParameter'] = { theme.syntax.type }

  hl_groups['CmpItemAbbrDeprecated'] = { link = 'Comment' }

  hl_groups['CmpItemAbbrMatch'] = { link = 'Search' }
  hl_groups['CmpItemAbbrMatchFuzzy'] = { link = 'CmpItemAbbrMatch' }

  -- lukas-reineke/indent-blankline.nvim
  hl_groups['@ibl.indent.char.1'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.2'] = { theme.colors.red, nocombine = true }
  hl_groups['@ibl.indent.char.3'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.4'] = { theme.colors.orange, nocombine = true }
  hl_groups['@ibl.indent.char.3'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.4'] = { theme.colors.yellow, nocombine = true }
  hl_groups['@ibl.indent.char.5'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.6'] = { theme.colors.green, nocombine = true }
  hl_groups['@ibl.indent.char.7'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.8'] = { theme.colors.aqua, nocombine = true }
  hl_groups['@ibl.indent.char.9'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.10'] = { theme.colors.blue, nocombine = true }
  hl_groups['@ibl.indent.char.11'] = { theme.surface1, nocombine = true }
  hl_groups['@ibl.indent.char.12'] = { theme.colors.purple, nocombine = true }

  -- simrat39/symbols-outline.nvim
  hl_groups['FocusedSymbol'] = { theme.syntax.call }

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
