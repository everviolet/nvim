local utils = require 'evergarden.utils'

---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    Normal = {
      theme.text,
      config.editor.transparent_background and theme.none or theme.base,
    },

    Cursor = { theme.yellow },
    CursorLine = { theme.none, theme.surface0 },
    CursorColumn = { theme.none, theme.surface0 },
    QuickFixLine = { theme.none, theme.surface0 },

    Visual = {
      theme.none,
      utils.vary_color(config, { summer = theme.surface0 }, theme.surface1),
    },

    LineNr = { theme.surface1 },
    CursorLineNr = { theme.overlay1 },
    SignColumn = { theme.none, theme.sign },
    WinSeparator = {
      config.editor.transparent_background and theme.mantle or theme.surface0,
    },
    VertSplit = { link = 'WinSeparator' },
    TabLineSel = utils.vary_reverse(
      theme.subtext1,
      theme.surface0,
      config.style.tabline,
      theme.crust,
      theme.accent
    ),
    TabLine = { theme.overlay1, theme.surface0 },
    TabLineFill = { theme.overlay1 },
    Title = { theme.subtext0 },
    Conceal = { theme.overlay1 },
    NonText = { theme.overlay0 },
    Folded = { bg = theme.surface2 },
    FoldColumn = { theme.surface0 },

    NormalFloat = {
      theme.text,
      theme.editor.float,
    },
    FloatBorder = utils.vary_reverse(
      theme.surface0,
      theme.editor.float,
      config.editor.float.invert_border and { 'reverse' } or {},
      theme.editor.float,
      theme.none
    ),
    FloatTitle = utils.vary_reverse(
      theme.overlay2,
      theme.editor.float,
      config.editor.float.invert_border and { 'reverse' } or {},
      theme.overlay2,
      theme.none
    ),
    StatusLine = { theme.overlay2, theme.none },
    StatusLineNC = { theme.overlay1, theme.surface0 },
    FloatShadow = { theme.none, theme.none },
    FloatShadowThrough = { theme.none, theme.none },

    OkText = { theme.diagnostic.ok },
    ErrorText = { theme.diagnostic.error },
    WarningText = { theme.diagnostic.warn },
    InfoText = { theme.diagnostic.info },
    HintText = { theme.diagnostic.hint },
    OkFloat = { theme.diagnostic.ok, theme.editor.float },
    ErrorFloat = { theme.diagnostic.error, theme.editor.float },
    WarningFloat = { theme.diagnostic.warn, theme.editor.float },
    InfoFloat = { theme.diagnostic.info, theme.editor.float },
    HintFloat = { theme.diagnostic.hint, theme.editor.float },

    Question = { theme.subtext0 },

    Search = utils.vary_reverse(
      utils.blend(theme.editor.search, theme.base, 0.4),
      utils.vary_color(config, { summer = theme.text }, theme.crust),
      config.style.search
    ),
    CurSearch = utils.vary_reverse(
      theme.editor.search,
      utils.vary_color(config, { summer = theme.text }, theme.crust),
      config.style.search
    ),
    IncSearch = utils.vary_reverse(
      theme.orange,
      utils.vary_color(config, { summer = theme.text }, theme.crust),
      config.style.incsearch
    ),

    Error = { theme.diagnostic.error },
    ErrorMsg = { link = 'Error' },
    WarningMsg = { theme.diagnostic.warn },
    MoreMsg = { theme.subtext0 },
    ModeMsg = { theme.surface1, theme.none },

    ColorColumn = { theme.none, theme.surface0 },

    Directory = { theme.overlay2 },

    Underlined = { theme.none, theme.none },

    -- Completion Menu
    Pmenu = { theme.overlay2, theme.editor.completion },
    PmenuBorder = utils.vary_reverse(
      theme.surface0,
      theme.editor.completion,
      config.editor.float.invert_border and { 'reverse' } or {},
      theme.editor.completion,
      theme.none
    ),
    PmenuKind = { theme.subtext0, theme.surface0 },
    PmenuExtra = { theme.pink, theme.surface0 },
    PmenuSel = {
      theme.crust,
      theme.accent,
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
    diffFile = { theme.syntax.identifier },
    diffNewFile = { theme.syntax.identifier },
    diffLine = { theme.text },
    Added = { link = '@diff.add' },
    Removed = { link = '@diff.delete' },
    Changed = { link = '@diff.change' },

    -- Spell
    SpellBad = { theme.red, style = { 'italic' } },
    SpellCap = { theme.aqua, style = { 'italic' } },
    SpellLocal = { theme.aqua, style = { 'italic' } },
    SpellRare = { theme.aqua, style = { 'italic' } },

    -- WinBar
    WinBar = { theme.subtext0 },
    WinBarNC = { theme.overlay2 },
  }
end
