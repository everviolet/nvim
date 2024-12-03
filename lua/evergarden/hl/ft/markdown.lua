---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
return function(theme, config)
  return {
    ['markdownH1'] = { link = '@text.title.1' },
    ['markdownH2'] = { link = '@text.title.2' },
    ['markdownH3'] = { link = '@text.title.3' },
    ['markdownH4'] = { link = '@text.title.4' },
    ['markdownH5'] = { link = '@text.title.5' },
    ['markdownH6'] = { link = '@text.title.6' },

    -- markdown
    ['markdownBold'] = { link = '@markup.strong' },
    ['markdownItalic'] = { link = '@markup.italic' },
    ['markdownUrl'] = { link = '@markup.link.url' },
  }
end
