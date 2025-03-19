---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['markdownH1'] = { link = '@markup.heading.1' },
    ['markdownH2'] = { link = '@markup.heading.2' },
    ['markdownH3'] = { link = '@markup.heading.3' },
    ['markdownH4'] = { link = '@markup.heading.4' },
    ['markdownH5'] = { link = '@markup.heading.5' },
    ['markdownH6'] = { link = '@markup.heading.6' },

    -- markdown
    ['markdownBold'] = { link = '@markup.strong' },
    ['markdownItalic'] = { link = '@markup.italic' },
    ['markdownUrl'] = { link = '@markup.link.url' },
  }
end
