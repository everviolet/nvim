local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  return {
    ['@lsp.type.class'] = {}, -- Identifiers that declare or reference a class type
    ['@lsp.type.comment'] = { link = '@comment' }, -- Tokens that represent a comment
    ['@lsp.type.decorator'] = {}, -- Identifiers that declare or reference decorators and annotations
    ['@lsp.type.enum'] = { link = '@type' }, -- Identifiers that declare or reference an enumeration type
    ['@lsp.type.enumMember'] = { link = '@constant' }, -- Identifiers that declare or reference an enumeration property, constant, or member
    ['@lsp.type.event'] = {}, -- Identifiers that declare an event property
    ['@lsp.type.function'] = { link = '@function' }, -- Identifiers that declare a function
    ['@lsp.type.interface'] = {}, -- Identifiers that declare or reference an interface type
    ['@lsp.type.keyword'] = { link = '@keyword' }, -- Tokens that represent a language keyword
    ['@lsp.type.macro'] = {}, -- Identifiers that declare a macro
    ['@lsp.type.method'] = { link = '@function.method' }, -- Identifiers that declare a member function or method
    ['@lsp.type.modifier'] = {}, -- Tokens that represent a modifier
    ['@lsp.type.namespace'] = { link = '@module' }, -- Identifiers that declare or reference a namespace, module, or package
    ['@lsp.type.number'] = { link = '@number' }, -- Tokens that represent a number literal
    ['@lsp.type.operator'] = { link = '@operator' }, -- Tokens that represent an operator
    ['@lsp.type.parameter'] = { link = '@variable.parameter' }, -- Identifiers that declare or reference a function or method parameters
    ['@lsp.type.property'] = { link = '@variable.member' }, -- Identifiers that declare or reference a member property, member field, or member variable
    ['@lsp.type.regexp'] = { link = '@string.regexp' }, -- Tokens that represent a regular expression literal
    ['@lsp.type.string'] = { link = '@string' }, -- Tokens that represent a string literal
    ['@lsp.type.struct'] = {}, -- Identifiers that declare or reference a struct type
    ['@lsp.type.type'] = { link = '@type' }, -- Identifiers that declare or reference a type that is not covered above
    ['@lsp.type.typeParameter'] = {}, -- Identifiers that declare or reference a type parameter
    ['@lsp.type.variable'] = { link = '@lsp' }, -- Identifiers that declare or reference a local or global variable

    ['@lsp.mod.abstract'] = {}, -- Types and member functions that are abstract
    ['@lsp.mod.async'] = {}, -- Functions that are marked async
    ['@lsp.mod.declaration'] = {}, -- Declarations of symbols
    ['@lsp.mod.defaultLibrary'] = {}, -- Symbols that are part of the standard library
    ['@lsp.mod.definition'] = {}, -- Definitions of symbols, for example, in header files
    ['@lsp.mod.documentation'] = {}, -- Occurrences of symbols in documentation
    ['@lsp.mod.modification'] = {}, -- Variable references where the variable is assigned to
    ['@lsp.mod.readonly'] = { link = '@constant' }, -- Readonly variables and member fields (constants)
    ['@lsp.mod.static'] = {}, -- Class members (static members)

    ['@lsp.typemod.class.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enum.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enumMember.defaultLibrary'] = { link = '@constant.builtin' },
    ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.keyword.async'] = { link = '@keyword.coroutine' },
    ['@lsp.typemod.macro.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.operator.injected'] = { link = '@operator' },
    ['@lsp.typemod.string.injected'] = { link = '@string' },
    ['@lsp.typemod.type.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },
    ['@lsp.typemod.variable.injected'] = { link = '@variable' },
  }
end

return M
