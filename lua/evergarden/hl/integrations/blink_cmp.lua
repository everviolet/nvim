local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    BlinkCmpLabel = { theme.text },
    BlinkCmpLabelMatch = { link = 'PmenuMatch' },

    BlinkCmpLabelDeprecated = { theme.overlay0, style = { 'strikethrough' } },
    BlinkCmpLabelDetail = { theme.overlay1 },
    BlinkCmpLabelDescription = { theme.overlay1 },

    BlinkCmpMenu = { link = 'Pmenu' },
    BlinkCmpDoc = { link = 'NormalFloat' },

    BlinkCmpMenuBorder = { link = 'PmenuBorder' },
    BlinkCmpDocBorder = { link = 'FloatBorder' },
    BlinkCmpDocSeparator = { link = 'FloatBorder' },
    BlinkCmpSignatureHelpBorder = { link = 'FloatBorder' },

    BlinkCmpSource = { theme.pink },

    BlinkCmpKind = { theme.text },
    BlinkCmpKindText = { theme.text },
    BlinkCmpKindMethod = { theme.syntax.constant },
    BlinkCmpKindFunction = { theme.syntax.func },
    BlinkCmpKindConstructor = { theme.syntax.type },
    BlinkCmpKindField = { theme.syntax.identifier },
    BlinkCmpKindVariable = { theme.syntax.identifier },
    BlinkCmpKindClass = { theme.syntax.type },
    BlinkCmpKindInterface = { theme.syntax.type },
    BlinkCmpKindModule = { theme.syntax.keyword },
    BlinkCmpKindProperty = { theme.syntax.keyword },
    BlinkCmpKindUnit = { theme.syntax.constant },
    BlinkCmpKindValue = { theme.syntax.constant },
    BlinkCmpKindEnum = { theme.syntax.constant },
    BlinkCmpKindKeyword = { theme.syntax.keyword },
    BlinkCmpKindSnippet = { theme.syntax.macro },
    BlinkCmpKindColor = { theme.syntax.constant },
    BlinkCmpKindFile = { theme.syntax.type },
    BlinkCmpKindReference = { theme.text },
    BlinkCmpKindFolder = { theme.syntax.type },
    BlinkCmpKindEnumMember = { theme.syntax.constant },
    BlinkCmpKindConstant = { theme.syntax.constant },
    BlinkCmpKindStruct = { theme.syntax.type },
    BlinkCmpKindEvent = { theme.syntax.keyword },
    BlinkCmpKindOperator = { link = 'Operator' },
    BlinkCmpKindTypeParameter = { theme.syntax.type },
    BlinkCmpKindCopilot = { theme.aqua },
  }
end

return M
