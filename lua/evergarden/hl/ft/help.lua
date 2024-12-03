---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    -- fix lsp hover doc
    ['@none.markdown'] = { theme.none, theme.none },
  }
end
