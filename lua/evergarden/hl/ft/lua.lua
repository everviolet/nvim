---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@constructor.lua'] = { link = '@delimiter' },

    ['@keyword.luadoc'] = { theme.syntax.annotation },
    ['@keyword.return.luadoc'] = { link = '@keyword.luadoc' },

    ['@lsp.type.keyword'] = { link = '@lsp' },
  }
end
