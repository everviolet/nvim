---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@lsp.type.heading.typst'] = { link = '@text.title' },
  }
end
