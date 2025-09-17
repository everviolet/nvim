local utils = require 'evergarden.utils'

---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    Normal = {
      theme.text,
      config.editor.transparent_background and theme.none or theme.base,
    },

    Cursor = { bg = theme.accent, fg = theme.crust },
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorLine = { theme.none, theme.surface0 },
    CursorColumn = { theme.none, theme.surface0 },

    Visual = {
      theme.none,
      theme.surface1,
    },

    LineNr = { theme.surface2 },
    CursorLineNr = { theme.overlay2 },
    QuickFixLine = { theme.none, theme.surface0 },
    SignColumn = { theme.overlay1, theme.sign },
    WinSeparator = {
      config.editor.transparent_background and theme.surface0 or theme.surface1,
    },
    VertSplit = { link = 'WinSeparator' },

    TabLine = { theme.overlay1, theme.surface0 },
    TabLineSel = utils.vary_reverse(
      theme.subtext1,
      theme.surface0,
      config.style.tabline,
      theme.crust,
      theme.accent
    ),
    TabLineFill = { theme.overlay1 },
    Title = { theme.subtext0 },
    Conceal = { theme.overlay1 },
    NonText = { theme.overlay0 },
    Folded = { bg = theme.surface2 },
    FoldColumn = { link = 'SignColumn' },

    NormalFloat = {
      theme.text,
      theme.editor.float,
    },
    FloatBorder = utils.vary_reverse(
      theme.overlay0,
      theme.editor.float,
      config.editor.float.solid_border and { 'reverse' } or {},
      theme.editor.float,
      theme.editor.float
    ),
    FloatTitle = utils.vary_reverse(
      theme.overlay2,
      theme.editor.float,
      config.editor.float.solid_border and { 'reverse' } or {},
      theme.crust,
      theme.accent
    ),
    StatusLine = {
      theme.subtext0,
      config.editor.transparent_background and theme.none or theme.mantle,
    },
    StatusLineNC = {
      theme.overlay1,
      config.editor.transparent_background and theme.none or theme.mantle,
    },
    FloatShadow = { bg = theme.crust, blend = 80 },
    FloatShadowThrough = { bg = theme.crust, blend = 100 },

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
      theme.none,
      config.style.search,
      utils.vary_color(config, { summer = theme.text }, theme.crust)
    ),
    CurSearch = utils.vary_reverse(
      theme.editor.search,
      theme.none,
      config.style.search,
      utils.vary_color(config, { summer = theme.text }, theme.crust)
    ),
    IncSearch = utils.vary_reverse(
      theme.editor.incsearch,
      theme.none,
      config.style.incsearch,
      utils.vary_color(config, { summer = theme.text }, theme.crust)
    ),
    Substitute = { link = 'IncSearch' },

    MsgArea = {
      theme.subtext1,
      config.editor.transparent_background and theme.none or theme.mantle,
    },
    Error = { theme.diagnostic.error },
    ErrorMsg = { link = 'Error' },
    WarningMsg = { theme.diagnostic.warn },
    MoreMsg = { theme.subtext0 },
    ModeMsg = { theme.overlay1, theme.none },

    ColorColumn = { theme.none, theme.surface0 },

    Directory = { theme.overlay2 },

    Underlined = { theme.none, theme.none },

    -- Completion Menu
    Pmenu = { theme.subtext1, theme.editor.completion },
    PmenuBorder = utils.vary_reverse(
      theme.surface0,
      theme.editor.completion,
      config.editor.float.solid_border and { 'reverse' } or {},
      theme.editor.completion,
      theme.none
    ),
    PmenuKind = { theme.subtext0 },
    PmenuExtra = { theme.pink },
    PmenuSel = {
      bg = theme.colors[config.editor.completion.selected.color]
        or theme.surface1,
      style = config.editor.completion.selected.style or { 'bold' },
    },
    PmenuMatch = { theme.editor.incsearch },

    ComplMatchIns = { link = 'NonText' },

    PmenuSbar = { theme.none, theme.surface1 },
    PmenuThumb = { theme.none, theme.overlay0 },

    -- Picker
    PickNormal = { link = 'NormalFloat' },
    PickBorder = { link = 'FloatBorder' },
    PickTitle = { link = 'FloatTitle' },
    PickSel = { theme.accent, theme.surface0, style = { 'bold' } },
    PickMatch = { link = 'PmenuMatch' },
    PickPointer = { theme.accent },
    PickMarker = { theme.yellow },
    PickPrompt = { theme.pink },

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
    SpellBad = { theme.red, style = config.style.spell },
    SpellCap = { theme.aqua, style = config.style.spell },
    SpellLocal = { theme.aqua, style = config.style.spell },
    SpellRare = { theme.aqua, style = config.style.spell },

    -- WinBar
    WinBar = { theme.subtext0 },
    WinBarNC = { theme.overlay2 },
  }
end
