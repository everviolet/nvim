---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@constructor.lua'] = { link = '@delimiter' },

    ['@keyword.luadoc'] = { theme.syntax.annotation },
    ['@keyword.return.luadoc'] = { link = '@keyword.luadoc' },

    ['@lsp.type.keyword.lua'] = { link = '@lsp' },

    -- both luals and emmylua mark way too many nodes as readonly.
    -- emmylua specifically also marks arguments as readonly.
    ['@lsp.mod.readonly.lua'] = { link = '@lsp' },
  }
end
