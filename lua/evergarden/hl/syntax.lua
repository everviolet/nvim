---@param theme evergarden.types.theme
---@param config evergarden.types.config
return function(theme, config)
  return {
    -- constants
    ['@constant'] = { theme.syntax.constant },
    ['@constant.builtin'] = { link = '@constant' }, -- constants defined by language: nil in lua
    ['@constant.macro'] = { link = '@constant' }, -- constants defined by macros: NULL in c

    -- constant literals
    ['@boolean'] = { link = '@constant' },
    ['@number'] = { link = '@constant' },
    ['@number.float'] = { link = '@number' },

    -- functions
    ['@function'] = { theme.syntax.func },
    ['@function.call'] = { link = '@function' },
    ['@function.builtin'] = { link = '@constant' },
    ['@function.macro'] = { theme.syntax.macro },
    ['@constructor'] = { link = '@function' },

    -- methods
    ['@function.method'] = { link = '@function' }, -- method definitions
    ['@function.method.call'] = { link = '@function.method' },

    -- keywords
    ['@keyword'] = {
      theme.syntax.keyword,
      style = config.style.keyword,
    },
    ['@keyword.function'] = { link = '@keyword' },
    ['@keyword.operator'] = { theme.orange },
    ['@keyword.modifier'] = { link = 'Keyword' }, -- construct modifiers: `const` `static` `mut` `public`
    ['@keyword.type'] = { link = 'Keyword' }, -- composite types: `struct` `enum`
    ['@keyword.coroutine'] = { theme.overlay1 }, -- e.g., `go` in Go, `async`/`await`
    ['@keyword.import'] = { link = '@annotation' }, -- e.g., `#include` in c, `use` or `extern crate` in rust, or `require` in Lua
    ['@keyword.repeat'] = { link = '@keyword' }, -- e.g., loops
    ['@keyword.return'] = { link = '@keyword' },
    ['@keyword.exception'] = { link = '@keyword' },
    ['@keyword.debug'] = { link = '@keyword.exception' },

    ['@label'] = { link = '@keyword' },

    ['@keyword.conditional'] = { link = '@keyword' },
    ['@keyword.conditional.ternary'] = { link = '@operator' },

    -- preprocessor directives & shebangs
    ['@annotation'] = { theme.syntax.annotation },
    ['@keyword.directive'] = { link = '@annotation' },
    ['@keyword.directive.define'] = { link = '@annotation' },
    ['@keyword.export'] = { theme.overlay1 },

    -- TODO:
    ['@module'] = { link = '@constant' },
    ['@none'] = { theme.text },

    ['@attribute'] = { theme.purple },

    ['@operator'] = { theme.syntax.context },

    -- delimiters
    ['@delimiter'] = { theme.syntax.context },
    ['@punctuation.bracket'] = { link = '@delimiter' },
    ['@punctuation.delimiter'] = { link = '@delimiter' },
    ['@punctuation.special'] = { link = '@string.special' },

    -- variables
    ['@variable'] = { theme.syntax.identifier },
    ['@variable.builtin'] = { link = '@constant' },
    ['@variable.parameter'] = { link = '@variable' },
    ['@variable.member'] = { theme.syntax.property },
    ['@property'] = { link = '@variable.member' },

    -- types
    ['@type'] = {
      theme.syntax.type,
      style = config.style.types,
    },
    ['@type.builtin'] = { link = '@type' },
    ['@type.definition'] = { link = '@keyword' }, -- type definitions: `typedef` in c

    -- strings
    ['@string'] = { theme.syntax.string },
    ['@string.documentation'] = { theme.skye }, -- docstrings
    ['@string.special'] = { link = '@punctuation.special' },
    ['@string.special.path'] = { link = '@string.special' }, -- filenames
    ['@string.special.url'] = { link = '@uri' }, -- URIs (e.g. hyperlinks)
    ['@string.special.symbol'] = { theme.subtext0 },
    ['@string.escape'] = { theme.yellow },
    ['@string.regexp'] = { link = '@string.escape' },
    ['@character'] = { link = '@string' }, -- char literal
    ['@character.special'] = { link = '@string.special' }, -- wildcards

    -- comments
    ['@comment'] = {
      theme.comment,
      style = config.style.comment,
    },
    ['@comment.documentation'] = { link = '@comment' },

    -- style
    ['@strike'] = { theme.overlay2 },
    ['@math'] = { theme.blue },
    ['@uri'] = { theme.purple },

    -- tags
    ['@tag'] = { link = '@punctuation.delimiter' }, -- XML-style tag names (e.g. in XML, HTML, etc.)
    ['@tag.builtin'] = { link = '@tag' }, -- JSX tags
    ['@tag.attribute'] = { link = '@attribute' }, -- XML-style tag attributes
    ['@tag.delimiter'] = { link = '@punctuation.delimiter' }, -- XML-style tag delimiters

    Identifier = { link = '@variable' },
    Type = { link = '@type' },
    Function = { link = '@function' },
    Structure = { theme.syntax.type },
    Keyword = { link = '@keyword' },
    Statement = { link = '@keyword' },
    Constant = { link = '@constant' },
    String = { link = '@string' },
    Label = { link = '@label' },
    Boolean = { link = '@boolean' },
    Number = { link = '@number' },
    Float = { link = '@number.float' },
    Conditional = { link = '@keyword.conditional' },
    Exception = { link = '@keyword.exception' },
    Repeat = { link = '@keyword.repeat' },

    Comment = { link = '@comment' },
    Special = { link = '@string.special' },
    Character = { link = '@character' },
    Delimiter = { link = '@punctuation.delimiter' },
    MatchParen = { theme.orange },
    Operator = { link = '@operator' },

    Todo = { link = '@comment.todo' },

    PreProc = { link = '@keyword.directive' },
    Define = { link = '@keyword.directive.define' },
    Include = { link = '@keyword.import' },

    -- lsp
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.keyword'] = { link = '@keyword' },

    -- text
    ['@comment.todo'] = { theme.aqua },
    ['@comment.note'] = { theme.blue },
    ['@comment.fix'] = { theme.diagnostic.warn },
    ['@comment.warning'] = { theme.diagnostic.warn },
    ['@comment.error'] = { theme.diagnostic.error },

    ['@nontext'] = { link = 'NonText' },
    ['@markup'] = { theme.text },
    ['@markup.strong'] = { theme.orange, style = { 'bold' } },
    ['@markup.italic'] = { theme.orange, style = { 'italic' } },
    ['@markup.quote'] = { link = '@comment' }, -- block quotes
    ['@markup.math'] = { link = '@markup.quote' }, -- math environments (e.g. `$ ... $` in LaTeX)
    ['@markup.environment'] = { link = '@markup.quote' }, -- environments (e.g. in LaTeX)
    ['@markup.link'] = { link = '@constant' }, -- text references, footnotes, citations, etc.
    ['@markup.link.label'] = { link = '@markup.italic' }, -- link, reference descriptions
    ['@markup.link.url'] = { link = '@uri' }, -- URL-style links
    ['@markup.raw'] = { theme.overlay1 }, -- literal or verbatim text (e.g. inline code)
    ['@markup.list'] = { link = '@delimiter' }, -- list markers
    ['@markup.list.checked'] = { theme.diagnostic.ok }, -- checked todo-style list markers
    ['@markup.list.unchecked'] = { link = '@punctuation.delimiter' }, -- unchecked todo-style list markers

    -- headings, titles (including markers)
    ['@markup.heading'] = { theme.purple },
    ['@markup.heading.1'] = { theme.purple },
    ['@markup.heading.2'] = { theme.orange },
    ['@markup.heading.3'] = { theme.green },
    ['@markup.heading.4'] = { link = '@markup.heading.1' },
    ['@markup.heading.5'] = { link = '@markup.heading.2' },
    ['@markup.heading.6'] = { link = 'NonText' },

    -- diffs
    ['@diff.add'] = { theme.diff.add },
    ['@diff.delete'] = { theme.diff.delete },
    ['@diff.change'] = { theme.diff.change },
    ['@diff.plus'] = { link = '@diff.add' },
    ['@diff.minus'] = { link = '@diff.delete' },
    ['@diff.delta'] = { link = '@diff.change' },

    -- legacy
    ['@parameter'] = { link = '@variable.parameter' },
    ['@field'] = { link = '@variable.member' },
    ['@namespace'] = { link = '@module' },
    ['@float'] = { link = '@number.float' },
    ['@symbol'] = { link = '@string.special.symbol' },
    ['@string.regex'] = { link = '@string.regexp' },

    ['@text'] = { link = '@markup' },
    ['@text.strong'] = { link = '@markup.strong' },
    ['@text.emphasis'] = { link = '@markup.italic' },
    ['@text.underline'] = { link = '@markup.underline' },
    ['@text.strike'] = { link = '@markup.strikethrough' },
    ['@text.math'] = { link = '@markup.math' },
    ['@text.environment'] = { link = '@markup.environment' },
    ['@text.environment.name'] = { link = '@markup.environment.name' },

    ['@text.title'] = { link = '@markup.heading' },
    ['@text.title.1'] = { link = '@markup.heading.1' },
    ['@text.title.2'] = { link = '@markup.heading.2' },
    ['@text.title.3'] = { link = '@markup.heading.3' },
    ['@text.title.4'] = { link = '@markup.heading.4' },
    ['@text.title.5'] = { link = '@markup.heading.5' },
    ['@text.title.6'] = { link = '@markup.heading.6' },
    ['@text.literal'] = { link = '@markup.raw' },
    ['@text.reference'] = { link = '@markup.link' },

    ['@text.todo.checked'] = { link = '@markup.list.checked' },
    ['@text.todo.unchecked'] = { link = '@markup.list.unchecked' },

    -- @text.todo is now for todo comments, not todo notes like in markdown
    ['@text.todo'] = { link = '@comment.todo' },
    ['@text.warning'] = { link = '@comment.warning' },
    ['@text.note'] = { link = '@comment.note' },
    ['@text.danger'] = { link = '@comment.error' },

    -- @text.uri is now
    -- > @markup.link.url in markup links
    -- > @string.special.url outside of markup
    ['@text.uri'] = { link = '@markup.link.url' },

    ['@method'] = { link = '@function.method' },
    ['@method.call'] = { link = '@function.method.call' },

    ['@text.diff.add'] = { link = '@diff.plus' },
    ['@text.diff.delete'] = { link = '@diff.minus' },

    ['@type.qualifier'] = { link = '@keyword.modifier' },
    ['@keyword.storage'] = { link = '@keyword.modifier' },
    ['@define'] = { link = '@keyword.directive.define' },
    ['@preproc'] = { link = '@keyword.directive' },
    ['@storageclass'] = { link = '@keyword.storage' },
    ['@conditional'] = { link = '@keyword.conditional' },
    ['@exception'] = { link = '@keyword.exception' },
    ['@include'] = { link = '@keyword.import' },
    ['@repeat'] = { link = '@keyword.repeat' },

    -- language specific

    ['@symbol.ruby'] = { link = '@string.special.symbol.ruby' },

    ['@variable.member.yaml'] = { link = '@field.yaml' },

    ['@text.title.1.markdown'] = { link = '@markup.heading.1.markdown' },
    ['@text.title.2.markdown'] = { link = '@markup.heading.2.markdown' },
    ['@text.title.3.markdown'] = { link = '@markup.heading.3.markdown' },
    ['@text.title.4.markdown'] = { link = '@markup.heading.4.markdown' },
    ['@text.title.5.markdown'] = { link = '@markup.heading.5.markdown' },
    ['@text.title.6.markdown'] = { link = '@markup.heading.6.markdown' },

    ['@method.php'] = { link = '@function.method.php' },
    ['@method.call.php'] = { link = '@function.method.call.php' },
  }
end
