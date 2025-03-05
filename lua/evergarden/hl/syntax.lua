---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    ['@annotation'] = { theme.syntax.annotation },
    ['@attribute'] = { theme.purple },
    ['@boolean'] = { link = 'Boolean' },
    ['@character'] = { link = 'Character' },
    ['@comment'] = {
      theme.comment,
      style = config.style.comment,
    },
    ['@conditional'] = { link = 'Conditional' },
    ['@constant'] = { theme.syntax.constant },
    ['@constant.builtin'] = { link = '@constant' },
    ['@constant.macro'] = { link = '@constant' },
    ['@constructor'] = { theme.green },
    ['@delimiter'] = { theme.syntax.context },
    ['@exception'] = { link = 'Exception' },
    ['@field'] = { link = '@variable.member' },
    ['@float'] = { link = 'Float' },
    ['@function'] = { theme.syntax.call },
    ['@function.call'] = { link = '@function' },
    ['@function.builtin'] = { link = '@constant' },
    ['@function.macro'] = { theme.syntax.macro },
    ['@include'] = { link = 'Include' },
    ['@keyword'] = {
      theme.syntax.keyword,
      style = config.style.keyword,
    },
    ['@keyword.function'] = { link = '@keyword' },
    ['@keyword.operator'] = { theme.orange },
    ['@label'] = { link = 'Label' },
    ['@method'] = { theme.syntax.context },
    ['@method.call'] = { link = '@function.call' },
    ['@namespace'] = { link = '@namespace' },
    ['@module'] = { link = '@constant' },
    ['@none'] = { theme.text },
    ['@number'] = { link = 'Number' },
    ['@operator'] = { link = '@delimiter' },
    ['@parameter'] = { link = '@variable.parameter' },
    ['@parameter.reference'] = { link = '@parameter' },
    ['@property'] = { theme.syntax.object },
    ['@punctuation.bracket'] = { link = '@delimiter' },
    ['@punctuation.delimiter'] = { link = '@delimiter' },
    ['@punctuation.special'] = { link = '@delimiter' },
    ['@repeat'] = { link = 'Repeat' },
    ['@storageclass'] = { link = 'StorageClass' },
    ['@string'] = { theme.syntax.string },
    ['@string.escape'] = { theme.yellow },
    ['@string.regex'] = { link = '@string.escape' },
    ['@symbol'] = { theme.text },
    ['@strike'] = { theme.overlay2 },
    ['@math'] = { theme.blue },
    ['@type'] = {
      theme.syntax.type,
      style = config.style.types,
    },
    ['@type.builtin'] = { link = '@type' },
    ['@type.qualifier'] = { link = '@keyword' },
    ['@uri'] = { theme.purple },
    ['@variable'] = { theme.syntax.object },
    ['@variable.builtin'] = { link = '@constant' },
    ['@variable.parameter'] = { link = '@variable' },
    ['@variable.member'] = { theme.syntax.object },

    Identifier = { link = '@variable' },
    Type = { link = '@type' },
    Function = { link = '@function' },
    Structure = { theme.syntax.type },
    Keyword = { link = '@keyword' },
    Statement = { link = '@keyword' },
    Constant = { link = '@constant' },
    String = { link = '@string' },

    Comment = { link = '@comment' },
    Special = { link = '@punctuation.special' },
    Delimiter = { link = '@punctuation.delimiter' },
    MatchParen = { theme.orange },
    Operator = { link = '@operator' },

    Todo = { link = '@comment.todo' },

    PreProc = { link = '@annotation' },
    Include = { link = '@annotation' },

    -- lsp
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.namespace'] = { link = '@namespace' },
    ['@lsp.type.keyword'] = { link = '@keyword' },

    -- text
    ['@comment.todo'] = { theme.aqua },
    ['@comment.note'] = { theme.blue },
    ['@comment.fix'] = { theme.diagnostic.warn },
    ['@comment.warning'] = { theme.diagnostic.warn },
    ['@comment.error'] = { theme.diagnostic.error },

    ['@nontext'] = { link = 'NonText' },
    ['@text'] = { theme.text },
    ['@text.emphasis'] = { theme.orange, style = { 'italic' } },
    ['@markup.strong'] = { theme.orange, style = { 'bold' } },
    ['@markup.italic'] = { theme.orange, style = { 'italic' } },
    ['@markup.heading'] = { link = '@text.title' }, -- headings, titles (including markers)
    ['@markup.quote'] = { link = '@comment' }, -- block quotes
    ['@markup.math'] = { link = '@markup.quote' }, -- math environments (e.g. `$ ... $` in LaTeX)
    ['@markup.environment'] = { link = '@markup.quote' }, -- environments (e.g. in LaTeX)
    ['@markup.link'] = { link = '@constant' }, -- text references, footnotes, citations, etc.
    ['@markup.link.label'] = { link = '@markup.italic' }, -- link, reference descriptions
    ['@markup.link.url'] = { link = '@nontext' }, -- URL-style links
    ['@markup.raw'] = { theme.overlay1 }, -- literal or verbatim text (e.g. inline code)
    ['@markup.raw.block'] = { theme.overlay1, theme.surface0 }, -- literal or verbatim text as a stand-alone block
    ['@markup.list'] = { link = '@delimiter' }, -- list markers
    ['@markup.list.checked'] = { link = '@string' }, -- checked todo-style list markers
    ['@markup.list.unchecked'] = { link = '@punctuation.delimiter' }, -- unchecked todo-style list markers
    ['@tag'] = { link = '@punctuation.delimiter' }, -- XML-style tag names (e.g. in XML, HTML, etc.)
    ['@tag.attribute'] = { link = '@attribute' }, -- XML-style tag attributes
    ['@tag.delimiter'] = { link = '@punctuation.delimiter' }, -- XML-style tag delimiters

    ['@text.title'] = { theme.purple },
    ['@text.title.1'] = { theme.purple },
    ['@text.title.2'] = { theme.orange },
    ['@text.title.3'] = { theme.green },
    ['@text.title.4'] = { link = '@text.title.1' },
    ['@text.title.5'] = { link = '@text.title.2' },
    ['@text.title.6'] = { link = 'NonText' },
    ['@markup.heading.1'] = { link = '@text.title.1' },
    ['@markup.heading.2'] = { link = '@text.title.2' },
    ['@markup.heading.3'] = { link = '@text.title.3' },
    ['@markup.heading.4'] = { link = '@text.title.4' },
    ['@markup.heading.5'] = { link = '@text.title.5' },
    ['@markup.heading.6'] = { link = '@text.title.6' },

    ['@string.special.path'] = { link = '@string.special' }, -- filenames
    ['@string.special.url'] = { link = '@string.special' }, -- URIs (e.g. hyperlinks)

    ['@diff.add'] = { theme.diff.add },
    ['@diff.delete'] = { theme.diff.delete },
    ['@diff.change'] = { theme.diff.change },
    ['@diff.plus'] = { link = '@diff.add' },
    ['@diff.minus'] = { link = '@diff.delete' },
    ['@diff.delta'] = { link = '@diff.change' },
  }
end
