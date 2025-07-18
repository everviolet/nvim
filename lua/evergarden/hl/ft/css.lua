---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['@property.css'] = { theme.blue },
    -- tag
    ['@tag.css'] = { link = '@keyword' },
    -- #id
    ['@constant.css'] = { link = '@constant' },
    -- .class
    ['@type.css'] = { link = '@type' },
    -- % or literals
    ['@string.css'] = { link = 'NonText' },
  }
end
