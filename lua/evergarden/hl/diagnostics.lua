local utils = require 'evergarden.utils'

---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    DiagnosticOk = { link = 'OkText' },
    DiagnosticError = { link = 'ErrorText' },
    DiagnosticWarn = { link = 'WarningText' },
    DiagnosticInfo = { link = 'InfoText' },
    DiagnosticHint = { link = 'HintText' },
    DiagnosticFloatingOk = { link = 'OkFloat' },
    DiagnosticFloatingError = { link = 'ErrorFloat' },
    DiagnosticFloatingWarn = { link = 'WarningFloat' },
    DiagnosticFloatingInfo = { link = 'InfoFloat' },
    DiagnosticFloatingHint = { link = 'HintFloat' },
    DiagnosticVirtualTextOk = {
      theme.diagnostic.ok,
      utils.blend(theme.diagnostic.ok, theme.base, 0.1),
    },
    DiagnosticVirtualTextError = {
      theme.diagnostic.error,
      utils.blend(theme.diagnostic.error, theme.base, 0.1),
    },
    DiagnosticVirtualTextWarn = {
      theme.diagnostic.warn,
      utils.blend(theme.diagnostic.warn, theme.base, 0.1),
    },
    DiagnosticVirtualTextInfo = {
      theme.diagnostic.info,
      utils.blend(theme.diagnostic.info, theme.base, 0.1),
    },
    DiagnosticVirtualTextHint = {
      theme.diagnostic.hint,
      utils.blend(theme.diagnostic.hint, theme.base, 0.1),
    },
    DiagnosticUnderlineOk = {
      theme.diagnostic.ok,
      theme.none,
      style = { 'underline' },
    },
    DiagnosticUnderlineError = {
      theme.diagnostic.error,
      theme.none,
      style = { 'underline' },
    },
    DiagnosticUnderlineWarn = {
      theme.diagnostic.warn,
      theme.none,
      style = { 'underline' },
    },
    DiagnosticUnderlineInfo = {
      theme.diagnostic.info,
      theme.none,
      style = { 'underline' },
    },
    DiagnosticUnderlineHint = {
      theme.diagnostic.hint,
      theme.none,
      style = { 'underline' },
    },
    DiagnosticSignOk = { theme.diagnostic.ok, theme.sign },
    DiagnosticSignError = { theme.diagnostic.error, theme.sign },
    DiagnosticSignWarn = { theme.diagnostic.warn, theme.sign },
    DiagnosticSignInfo = { theme.diagnostic.info, theme.sign },
    DiagnosticSignHint = { theme.diagnostic.hint, theme.sign },
    LspDiagnosticsFloatingError = { link = 'DiagnosticFloatingError' },
    LspDiagnosticsFloatingWarning = { link = 'DiagnosticFloatingWarn' },
    LspDiagnosticsFloatingInformation = { link = 'DiagnosticFloatingInfo' },
    LspDiagnosticsFloatingHint = { link = 'DiagnosticFloatingHint' },
    LspDiagnosticsDefaultError = { link = 'DiagnosticError' },
    LspDiagnosticsDefaultWarning = { link = 'DiagnosticWarn' },
    LspDiagnosticsDefaultInformation = { link = 'DiagnosticInfo' },
    LspDiagnosticsDefaultHint = { link = 'DiagnosticHint' },
    LspDiagnosticsVirtualTextError = { link = 'DiagnosticVirtualTextError' },
    LspDiagnosticsVirtualTextWarning = { link = 'DiagnosticVirtualTextWarn' },
    LspDiagnosticsVirtualTextInformation = {
      link = 'DiagnosticVirtualTextInfo',
    },
    LspDiagnosticsVirtualTextHint = { link = 'DiagnosticVirtualTextHint' },
    LspDiagnosticsUnderlineError = { link = 'DiagnosticUnderlineError' },
    LspDiagnosticsUnderlineWarning = { link = 'DiagnosticUnderlineWarn' },
    LspDiagnosticsUnderlineInformation = { link = 'DiagnosticUnderlineInfo' },
    LspDiagnosticsUnderlineHint = { link = 'DiagnosticUnderlineHint' },
    LspDiagnosticsSignError = { link = 'DiagnosticSignError' },
    LspDiagnosticsSignWarning = { link = 'DiagnosticSignWarn' },
    LspDiagnosticsSignInformation = { link = 'DiagnosticSignInfo' },
    LspDiagnosticsSignHint = { link = 'DiagnosticSignHint' },

    VirtualTextInfo = { theme.subtext0 },
    LspReferenceText = { bg = theme.surface0 },
    LspReferenceRead = { link = 'LspReferenceText' },
    LspReferenceWrite = { link = 'LspReferenceText' },
    LspCodeLens = { link = 'VirtualTextInfo' },
    LspCodeLensSeparator = { link = 'MsgSeparator' },
    LspInlayHint = { theme.overlay1 },
    LspSignatureActiveParameter = { bg = theme.surface1 },

    healthError = { link = 'DiagnosticError' },
    healthSuccess = { link = 'DiagnosticOk' },
    healthWarning = { link = 'DiagnosticWarn' },

    DiagnosticDeprecated = {
      theme.diagnostic.warn,
      theme.none,
      style = { 'strikethrough' },
    },
  }
end
