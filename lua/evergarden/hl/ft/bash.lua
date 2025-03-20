---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@variable.parameter.bash'] = { theme.subtext1 },
    ['@lsp.type.parameter.bash'] = { link = '@variable.parameter.bash' },
  }
end
