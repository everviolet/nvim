---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    Normal = { theme.text, theme.base },

    Cursor = { theme.yellow },
    CursorLine = { theme.none, theme.surface },
    CursorColumn = { theme.none, theme.surface },
    QuickFixLine = { theme.none, theme.surface },

    Visual = { theme.none, theme.surface1 },

    LineNr = { theme.surface1 },
    CursorLineNr = { theme.overlay1 },
    SignColumn = { theme.none, theme.sign },
    WinSeparator = {
      config.transparent_background and theme.mantle or theme.surface,
    },
    VertSplit = { link = 'WinSeparator' },
    TabLineSel = { theme.accent, style = config.style.tabline },
    TabLine = { theme.overlay1 },
    TabLineFill = { link = 'TabLine' },
    Title = { theme.subtext0 },
    Conceal = { theme.overlay1 },
    NonText = { theme.overlay0 },
    Folded = { theme.overlay1 },
    FoldColumn = { theme.surface },

    NormalFloat = { theme.text, theme.surface },
    FloatBorder = { theme.surface1 },
    StatusLine = { theme.overlay2, theme.none },
    StatusLineNC = { theme.overlay1, theme.surface },
    FloatShadow = { theme.none, theme.none },
    FloatShadowThrough = { theme.none, theme.none },

    OkText = { theme.diagnostic.ok },
    ErrorText = { theme.diagnostic.error },
    WarningText = { theme.diagnostic.warn },
    InfoText = { theme.diagnostic.info },
    HintText = { theme.diagnostic.hint },
    OkFloat = { theme.diagnostic.ok, theme.surface },
    ErrorFloat = { theme.diagnostic.error, theme.surface },
    WarningFloat = { theme.diagnostic.warn, theme.surface },
    InfoFloat = { theme.diagnostic.info, theme.surface },
    HintFloat = { theme.diagnostic.hint, theme.surface },

    Question = { theme.subtext0 },

    Search = {
      theme.orange,
      style = config.style.search,
    },
    CurSearch = {
      theme.orange,
      style = config.style.incsearch,
    },
    IncSearch = { link = 'CurSearch' },

    Error = { theme.diagnostic.error },
    ErrorMsg = { link = 'Error' },
    WarningMsg = { theme.diagnostic.warn },
    MoreMsg = { theme.subtext0 },
    ModeMsg = { theme.surface1, theme.none },

    ColorColumn = { theme.none, theme.surface },

    Directory = { theme.overlay2 },

    Underlined = { theme.none, theme.none },

    -- Completion Menu
    Pmenu = { theme.text, theme.surface },
    PmenuSel = {
      theme.surface1,
      theme.accent,
      style = config.style.search,
    },
    PmenuSbar = { theme.none, theme.surface1 },
    PmenuThumb = { theme.none, theme.overlay0 },

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

    -- WinBar
    WinBar = { theme.subtext0 },
    WinBarNC = { theme.overlay2 },
  }
end
