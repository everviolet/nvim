local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['CmpItemMenu'] = { theme.syntax.constant, italic = true },

    ['CmpItemKindText'] = { theme.text },
    ['CmpItemKindMethod'] = { theme.syntax.constant },
    ['CmpItemKindFunction'] = { theme.syntax.call },
    ['CmpItemKindConstructor'] = { theme.syntax.type },
    ['CmpItemKindField'] = { theme.syntax.object },
    ['CmpItemKindVariable'] = { theme.syntax.object },
    ['CmpItemKindClass'] = { theme.syntax.type },
    ['CmpItemKindInterface'] = { theme.syntax.type },
    ['CmpItemKindModule'] = { theme.syntax.keyword },
    ['CmpItemKindProperty'] = { theme.syntax.keyword },
    ['CmpItemKindUnit'] = { theme.syntax.constant },
    ['CmpItemKindValue'] = { theme.syntax.constant },
    ['CmpItemKindEnum'] = { theme.syntax.constant },
    ['CmpItemKindKeyword'] = { theme.syntax.keyword },
    ['CmpItemKindSnippet'] = { theme.syntax.macro },
    ['CmpItemKindColor'] = { theme.syntax.constant },
    ['CmpItemKindFile'] = { theme.syntax.type },
    ['CmpItemKindReference'] = { theme.syntax.context },
    ['CmpItemKindFolder'] = { theme.syntax.type },
    ['CmpItemKindEnumMember'] = { theme.syntax.constant },
    ['CmpItemKindConstant'] = { theme.syntax.constant },
    ['CmpItemKindStruct'] = { theme.syntax.type },
    ['CmpItemKindEvent'] = { theme.syntax.keyword },
    ['CmpItemKindOperator'] = { link = 'Operator' },
    ['CmpItemKindTypeParameter'] = { theme.syntax.type },

    ['CmpItemAbbrDeprecated'] = { link = 'Comment' },

    ['CmpItemAbbrMatch'] = { link = 'Search' },
    ['CmpItemAbbrMatchFuzzy'] = { link = 'CmpItemAbbrMatch' },
  }
end

return M
