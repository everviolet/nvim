---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@variable.parameter.builtin.nix'] = { theme.overlay0 }, -- `{ ... }:`
  }
end
