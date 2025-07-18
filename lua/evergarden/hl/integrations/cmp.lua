local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    CmpItemAbbr = { theme.text, style = { 'italic' } },
    CmpItemAbbrDeprecated = { theme.overlay0, style = { 'strikethrough' } },
    CmpItemKind = { theme.text },
    CmpItemMenu = { theme.syntax.constant, style = { 'italic' } },

    CmpItemAbbrMatch = { link = 'PmenuMatch' },
    CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },

    CmpItemKindText = { theme.text },
    CmpItemKindMethod = { theme.syntax.constant },
    CmpItemKindFunction = { theme.syntax.func },
    CmpItemKindConstructor = { theme.syntax.type },
    CmpItemKindField = { theme.syntax.identifier },
    CmpItemKindVariable = { theme.syntax.identifier },
    CmpItemKindClass = { theme.syntax.type },
    CmpItemKindInterface = { theme.syntax.type },
    CmpItemKindModule = { theme.syntax.keyword },
    CmpItemKindProperty = { theme.syntax.keyword },
    CmpItemKindUnit = { theme.syntax.constant },
    CmpItemKindValue = { theme.syntax.constant },
    CmpItemKindEnum = { theme.syntax.constant },
    CmpItemKindKeyword = { theme.syntax.keyword },
    CmpItemKindSnippet = { theme.syntax.macro },
    CmpItemKindColor = { theme.syntax.constant },
    CmpItemKindFile = { theme.syntax.type },
    CmpItemKindReference = { theme.text },
    CmpItemKindFolder = { theme.syntax.type },
    CmpItemKindEnumMember = { theme.syntax.constant },
    CmpItemKindConstant = { theme.syntax.constant },
    CmpItemKindStruct = { theme.syntax.type },
    CmpItemKindEvent = { theme.syntax.keyword },
    CmpItemKindOperator = { link = 'Operator' },
    CmpItemKindTypeParameter = { theme.syntax.type },
    CmpItemKindCopilot = { theme.aqua },
  }
end

return M
