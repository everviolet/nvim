local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  local cfg = config.integrations.mini
  if not cfg then
    return {}
  end

  local hlgroups = {}

  if cfg.animate then
    table.insert(hlgroups, {
      MiniAnimateCursor = { style = { 'reverse', 'nocombine' } },
      MiniAnimateNormalFloat = { link = 'NormalFloat' },
    })
  end

  if cfg.clue then
    table.insert(hlgroups, {
      MiniClueBorder = { link = 'FloatBorder' },
      MiniClueDescGroup = { link = 'DiagnosticFloatingWarn' },
      MiniClueDescSingle = { link = 'NormalFloat' },
      MiniClueNextKey = { link = 'DiagnosticFloatingHint' },
      MiniClueNextKeyWithPostkeys = { link = 'DiagnosticFloatingError' },
      MiniClueSeparator = { link = 'DiagnosticFloatingInfo' },
      MiniClueTitle = { link = 'FloatTitle' },
    })
  end

  if cfg.completion then
    table.insert(hlgroups, {
      MiniCompletionActiveParameter = { link = 'LspSignatureActiveParameter' },
    })
  end

  if cfg.cursorword then
    table.insert(hlgroups, {
      MiniCursorword = { link = 'LspReferenceText' },
      MiniCursorwordCurrent = { link = 'MiniCursorword' },
    })
  end

  if cfg.deps then
    table.insert(hlgroups, {
      MiniDepsChangeAdded = { link = 'diffAdded' },
      MiniDepsChangeRemoved = { link = 'diffRemoved' },
      MiniDepsHint = { link = 'DiagnosticHint' },
      MiniDepsInfo = { link = 'DiagnosticInfo' },
      MiniDepsMsgBreaking = { link = 'DiagnosticWarn' },
      MiniDepsPlaceholder = { link = 'Comment' },
      MiniDepsTitle = { link = 'Title' },
      MiniDepsTitleError = { bg = theme.diagnostic.error, theme.crust },
      MiniDepsTitleSame = { link = 'DiffText' },
      MiniDepsTitleUpdate = { bg = theme.diagnostic.ok, theme.crust },
    })
  end

  if cfg.diff then
    table.insert(hlgroups, {
      MiniDiffSignAdd = { theme.diff.add },
      MiniDiffSignChange = { theme.diff.change },
      MiniDiffSignDelete = { theme.diff.delete },
      MiniDiffOverAdd = { link = 'DiffAdd' },
      MiniDiffOverChange = { link = 'DiffText' },
      MiniDiffOverContext = { link = 'DiffChange' },
      MiniDiffOverDelete = { link = 'DiffDelete' },
    })
  end

  if cfg.files then
    table.insert(hlgroups, {
      MiniFilesNormal = { link = 'NormalFloat' },
      MiniFilesCursorLine = { link = 'CursorLine' },

      MiniFilesDirectory = { link = 'Directory' },
      MiniFilesFile = { theme.syntax.identifier },

      MiniFilesBorder = { link = 'FloatBorder' },
      MiniFilesBorderModified = { theme.diagnostic.warn },

      MiniFilesTitle = { link = 'MiniFilesBorder' },
      MiniFilesTitleFocused = { link = 'FloatTitle' },
    })
  end

  if cfg.hipatterns then
    table.insert(hlgroups, {
      MiniHipatternsFixme = {
        bg = theme.diagnostic.warn,
        theme.crust,
        style = { 'bold' },
      },
      MiniHipatternsHack = {
        bg = theme.diagnostic.warn,
        theme.crust,
        style = { 'bold' },
      },
      MiniHipatternsNote = { bg = theme.blue, theme.crust, style = { 'bold' } },
      MiniHipatternsTodo = { bg = theme.aqua, theme.crust, style = { 'bold' } },
    })
  end

  if cfg.icons then
    table.insert(hlgroups, {
      MiniIconsAzure = { theme.skye },
      MiniIconsBlue = { theme.blue },
      MiniIconsCyan = { theme.aqua },
      MiniIconsGreen = { theme.green },
      MiniIconsGrey = { theme.text },
      MiniIconsOrange = { theme.orange },
      MiniIconsPurple = { theme.pink },
      MiniIconsRed = { theme.red },
      MiniIconsYellow = { theme.yellow },
    })
  end

  if cfg.indentscope then
    table.insert(hlgroups, {
      MiniIndentscopeSymbol = { theme.accent },
      MiniIndentscopePrefix = { style = { 'nocombine' } }, -- make it invisible
    })
  end

  if cfg.jump then
    table.insert(hlgroups, {
      MiniJump = { link = 'IncSearch' },
    })
  end

  if cfg.jump2d then
    table.insert(hlgroups, {
      MiniJump2dDim = { theme.overlay0 },
      MiniJump2dSpot = { link = 'IncSearch' },
      MiniJump2dSpotAhead = { theme.subtext0 },
      MiniJump2dSpotUnique = { theme.aqua, style = config.style.incsearch },
    })
  end

  if cfg.map then
    table.insert(hlgroups, {
      MiniMapNormal = { link = 'NormalFloat' },
      MiniMapSymbolCount = { link = 'Special' },
      MiniMapSymbolLine = { link = 'Title' },
      MiniMapSymbolView = { link = 'Delimiter' },
    })
  end

  if cfg.notify then
    table.insert(hlgroups, {
      MiniNotifyBorder = { link = 'FloatBorder' },
      MiniNotifyNormal = { link = 'NormalFloat' },
      MiniNotifyTitle = { link = 'FloatTitle' },
    })
  end

  if cfg.operators then
    table.insert(hlgroups, {
      MiniOperatorsExchangeFrom = { link = 'IncSearch' },
    })
  end

  if cfg.pick then
    table.insert(hlgroups, {
      MiniPickBorder = { link = 'PickBorder' }, -- window border.
      MiniPickBorderBusy = { theme.diagnostic.warn }, -- window border while picker is busy processing.
      MiniPickBorderText = { theme.subtext0 }, -- non-prompt on border.
      MiniPickCursor = { link = 'PickPointer' }, -- cursor during active picker (hidden by default).
      MiniPickIconDirectory = { theme.overlay2 }, -- default icon for directory.
      MiniPickIconFile = { theme.subtext1 }, -- default icon for file.
      MiniPickHeader = { theme.subtext0 }, -- headers in info buffer and previews.
      MiniPickMatchCurrent = { link = 'PickSel' }, -- current matched item.
      MiniPickMatchMarked = { link = 'PickMarker' }, -- marked matched items.
      MiniPickMatchRanges = { link = 'PickMatch' }, -- ranges matching query elements.
      MiniPickNormal = { link = 'PickNormal' }, -- basic foreground/background highlighting.
      MiniPickPreviewLine = { theme.none, theme.surface0 }, -- target line in preview.
      MiniPickPreviewRegion = { theme.none, theme.surface0 }, -- target region in preview.
      MiniPickPrompt = { link = 'PickPrompt' }, -- prompt.
    })
  end

  if cfg.starter then
    table.insert(hlgroups, {
      MiniStarterCurrent = {},
      MiniStarterFooter = { theme.subtext0, style = { 'italic' } },
      MiniStarterHeader = { theme.syntax.constant },
      MiniStarterInactive = { link = '@comment' },
      MiniStarterItem = { theme.text },
      MiniStarterItemBullet = { theme.blue },
      MiniStarterItemPrefix = { theme.pink },
      MiniStarterSection = { bg = theme.accent, theme.crust },
      MiniStarterQuery = { theme.accent },
    })
  end

  if cfg.statusline then
    table.insert(hlgroups, {
      MiniStatuslineDevinfo = { theme.subtext0, theme.surface1 },
      MiniStatuslineFileinfo = { theme.subtext0, theme.surface1 },
      MiniStatuslineFilename = { theme.text, theme.mantle },
      MiniStatuslineInactive = { theme.subtext0, theme.mantle },
      MiniStatuslineModeNormal = {
        bg = theme.accent,
        theme.crust,
        style = { 'bold' },
      },
      MiniStatuslineModeCommand = {
        bg = theme.accent,
        theme.crust,
        style = { 'bold' },
      },
      MiniStatuslineModeInsert = {
        bg = theme.text,
        theme.crust,
        style = { 'bold' },
      },
      MiniStatuslineModeVisual = {
        bg = theme.pink,
        theme.crust,
        style = { 'bold' },
      },
      MiniStatuslineModeReplace = {
        bg = theme.text,
        theme.crust,
        style = { 'bold' },
      },
      MiniStatuslineModeOther = {
        bg = theme.aqua,
        theme.base,
        style = { 'bold' },
      },
    })
  end

  if cfg.surround then
    table.insert(hlgroups, {
      MiniSurround = { link = 'IncSearch' },
    })
  end

  if cfg.tabline then
    table.insert(hlgroups, {
      MiniTablineCurrent = {
        theme.text,
        theme.base,
        style = config.style.tabline,
      },
      MiniTablineFill = {
        link = 'TablineFill',
      },
      MiniTablineHidden = {
        theme.text,
        config.editor.transparent_background and theme.none or theme.mantle,
      },
      MiniTablineModifiedCurrent = {
        theme.diagnostic.warn,
        style = config.style.tabline,
      },
      MiniTablineModifiedHidden = { theme.diagnostic.warn },
      MiniTablineModifiedVisible = { theme.diagnostic.warn },
      MiniTablineTabpagesection = { theme.surface1, theme.base },
      MiniTablineVisible = {},
    })
  end

  if cfg.test then
    table.insert(hlgroups, {
      MiniTestEmphasis = { link = '@text.emphasis' },
      MiniTestFail = {
        bg = theme.diagnostic.error,
        theme.crust,
        style = { 'bold' },
      },
      MiniTestPass = {
        bg = theme.diagnostic.ok,
        theme.crust,
        style = { 'bold' },
      },
    })
  end

  if cfg.trailspace then
    table.insert(hlgroups, {
      MiniTrailspace = { theme.diagnostic.error },
    })
  end

  return hlgroups
end

return M
