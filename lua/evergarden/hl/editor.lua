---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
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
    NonText = { theme.overlay0 },
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
end
