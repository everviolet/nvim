---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@variable.member.nix'] = { theme.blue },
    ['@lsp.type.property.nix'] = { link = '@variable.member.nix' },

    ['@variable.parameter.nix'] = { theme.red },
    ['@lsp.type.parameter.nix'] = { link = '@variable.parameter.nix' },

    ['@lsp.type.variable.nix'] = { theme.subtext0 },
  }
end
