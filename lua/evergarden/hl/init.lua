local M = {}

---@alias evergarden.types.colorspec { fg?: string, bg?: string, [1]: string, [2]: string, link: string, reverse: boolean }
---@alias evergarden.types.hlgroups { [string]: evergarden.types.colorspec }

---@param theme evergarden.types.theme
---@param config evergarden.types.config
function M.setup(theme, config)
  ---@type evergarden.types.hlgroups
  local hl_groups = {
    RedAccent = { theme.red, '#453539' },
    OrangeAccent = { theme.orange, '#4A453E' },
    YellowAccent = { theme.yellow, '#4A4941' },
    GreenAccent = { theme.green, '#384239' },
    AquaAccent = { theme.aqua, '#344240' },
    SkyeAccent = { theme.skye, '#313F42' },
    BlueAccent = { theme.blue, '#363A47' },
    PurpleAccent = { theme.purple, '#43374A' },
    PinkAccent = { theme.pink, '#453547' },

    Normal = { theme.text, theme.base },

    Cursor = { theme.yellow },
    CursorLine = { theme.none, theme.surface0 },
    CursorColumn = { theme.none, theme.surface0 },
    QuickFixLine = { theme.none, theme.surface0 },

    Visual = { theme.none, theme.surface1 },

    LineNr = { theme.surface1 },
    CursorLineNr = { theme.comment },
    SignColumn = { theme.none, theme.sign },
    WinSeparator = {
      config.transparent_background and theme.surface1 or theme.crust,
    },
    VertSplit = { link = 'WinSeparator' },
    TabLineSel = config.style.tabline.reverse
        and { theme.base, theme.colors[config.style.tabline.color] }
      or { theme.colors[config.style.tabline.color] },
    TabLine = { theme.comment },
    TabLineFill = { link = 'TabLine' },
    Title = { theme.comment },
    NonText = { theme.overlay2 },
    Folded = { theme.comment },
    FoldColumn = { theme.surface0 },

    NormalFloat = { theme.text, theme.surface0 },
    FloatBorder = { theme.surface1 },
    StatusLine = { theme.overlay2, theme.none },
    StatusLineNC = { theme.overlay2, theme.surface0 },
    FloatShadow = { theme.none, theme.none },
    FloatShadowThrough = { theme.none, theme.none },

    OkText = { theme.diagnostic.ok, theme.none },
    ErrorText = { theme.diagnostic.error, theme.none },
    WarningText = { theme.diagnostic.warn, theme.none },
    InfoText = { theme.diagnostic.info, theme.none },
    HintText = { theme.diagnostic.hint, theme.none },
    OkFloat = { theme.diagnostic.ok, theme.surface0 },
    ErrorFloat = { theme.diagnostic.error, theme.surface0 },
    WarningFloat = { theme.diagnostic.warn, theme.surface0 },
    InfoFloat = { theme.diagnostic.info, theme.surface0 },
    HintFloat = { theme.diagnostic.hint, theme.surface0 },

    Question = { theme.comment },

    Search = { theme.orange, reverse = config.style.search.reverse },
    CurSearch = { theme.orange, reverse = config.style.search.inc_reverse },
    IncSearch = { link = 'CurSearch' },

    Error = { theme.diagnostic.error },
    ErrorMsg = { link = 'Error' },
    WarningMsg = { theme.diagnostic.warn },
    MoreMsg = { theme.comment },
    ModeMsg = { theme.surface1, theme.none },

    ColorColumn = { theme.none, theme.surface0 },

    Directory = { theme.overlay2 },

    Underlined = { theme.none, theme.none },

    -- Completion Menu
    Pmenu = { theme.text, theme.surface0 },
    PmenuSel = {
      theme.surface1,
      theme.green,
      reverse = config.style.search.reverse,
    },
    PmenuSbar = { theme.none, theme.surface1 },
    PmenuThumb = { theme.none, theme.overlay2 },

    -- Diffs
    DiffAdd = { theme.diff.add, theme.none },
    DiffDelete = { theme.diff.delete, theme.none },
    DiffChange = { theme.diff.change, theme.none },
    DiffText = { theme.subtext0, theme.none },
    diffAdded = { link = '@diff.add' },
    diffRemoved = { link = '@diff.delete' },
    diffChanged = { link = '@diff.change' },
    diffFile = { theme.syntax.object },
    diffNewFile = { theme.syntax.object },
    diffLine = { theme.syntax.context },
    Added = { link = '@diff.add' },
    Removed = { link = '@diff.delete' },
    Changed = { link = '@diff.change' },

    -- Spell
    SpellCap = { theme.green },
    SpellBad = { theme.aqua },
    SpellLocal = { theme.aqua },
    SpellRare = { theme.purple },
  }

  vim
    .iter(ipairs { 'syntax', 'treesitter', 'diagnostics' })
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

  -- lsp
  hl_groups['@constructor.lua'] = { theme.syntax.context }

  vim.iter(ipairs { 'html', 'scss' }):each(function(_, ft)
    local ok, hl_ft_fn = pcall(require, ('evergarden.hl.ft.%s'):format(ft))
    if not ok then
      return
    end
    ---@diagnostic disable-next-line: redefined-local
    local ok, hl_imports = pcall(hl_ft_fn, theme, config)
    if not ok then
      return
    end
    hl_groups = vim.tbl_deep_extend('force', hl_groups, hl_imports)
  end)

  local load_integration = function(name)
    local ok, mod =
      pcall(require, string.format('evergarden.hl.integrations.%s', name))
    if ok then
      local hls = mod.get(theme, config)
      for hl_name, value in pairs(hls) do
        hl_groups[hl_name] = value
      end
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

  hl_groups['@lsp.type.macro.rust'] = { theme.syntax.macro }

  -- fix lsp hover doc
  hl_groups['@none.markdown'] = { theme.none, theme.none }

  -- hl_groups['@include.typescript'] = { theme.syntax.keyword }

  hl_groups['markdownH1'] = { link = '@text.title.1' }
  hl_groups['markdownH2'] = { link = '@text.title.2' }
  hl_groups['markdownH3'] = { link = '@text.title.3' }
  hl_groups['markdownH4'] = { link = '@text.title.4' }
  hl_groups['markdownH5'] = { link = '@text.title.5' }
  hl_groups['markdownH6'] = { link = '@text.title.6' }

  -- markdown
  hl_groups['markdownBold'] = { link = '@markup.strong' }
  hl_groups['markdownItalic'] = { link = '@markup.italic' }
  hl_groups['markdownUrl'] = { link = '@markup.link.url' }

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
