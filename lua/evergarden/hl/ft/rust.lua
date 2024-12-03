---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@lsp.type.macro.rust'] = { theme.syntax.macro },
  }
end
