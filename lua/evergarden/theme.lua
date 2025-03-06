---@class evergarden.types.styleconfig
---@field tabline evergarden.types.styleopt
---@field search evergarden.types.styleopt
---@field incsearch evergarden.types.styleopt
---@field types evergarden.types.styleopt
---@field keyword evergarden.types.styleopt
---@field comment evergarden.types.styleopt

---@class evergarden.types.theme
---@field none string
---@field colors evergarden.types.colors
---@field text string
---@field subtext1 string
---@field subtext0 string
---@field overlay2 string
---@field overlay1 string
---@field overlay0 string
---@field surface2 string
---@field surface1 string
---@field surface0 string
---@field base string
---@field mantle string
---@field crust string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field aqua string
---@field skye string
---@field blue string
---@field purple string
---@field pink string
---@field accent string
---@field editor evergarden.types.editor
---@field syntax evergarden.types.syntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: string }
---@field diff { ['add'|'delete'|'change']: string }
---@field git { ['staged'|'unstaged'|'ignored'|'untracked']: string }
---@field sign string
---@field comment string

---@class evergarden.types.editor
---@field search string
---@field float string
---@field completion string

---@class evergarden.types.syntax
---@field keyword string
---@field object string
---@field type string
---@field context string
---@field constant string
---@field call string
---@field string string
---@field macro string
---@field annotation string

local utils = require 'evergarden.utils'

local M = {}

---@param colors? evergarden.types.colors
---@param config? evergarden.types.config
---@return evergarden.types.theme
function M.setup(colors, config)
  if not config then
    config = require('evergarden.config').get()
  end
  if not colors then
    colors = require('evergarden.colors').get(config)
  end
  ---@type evergarden.types.theme
  local theme = vim.deepcopy(colors, true)

  theme.none = 'NONE'
  theme.colors = colors

  if config.editor.transparent_background then
    theme.base = theme.none
  end

  theme.accent = theme.colors[config.theme.accent] or theme.green
  theme.sign = theme.colors[config.editor.sign.color] or theme.none
  theme.comment = theme.overlay2

  theme.editor = {
    search = theme.skye,
    float = theme.colors[config.editor.float.color] or theme.none,
    completion = theme.colors[config.editor.completion.color] or theme.none,
  }
  theme.syntax = {
    keyword = theme.red,
    object = theme.text,
    type = theme.yellow,
    context = theme.overlay2,
    constant = theme.pink,
    call = theme.green,
    string = theme.green,
    macro = theme.orange,
    annotation = theme.red,
  }
  theme.diagnostic = {
    ok = theme.green,
    error = theme.red,
    warn = theme.yellow,
    info = theme.aqua,
    hint = theme.skye,
  }
  theme.diff = {
    add = theme.green,
    delete = theme.red,
    change = theme.aqua,
  }
  theme.git = {
    staged = theme.green,
    unstaged = theme.skye,
    ignored = theme.overlay0,
    untracked = theme.subtext1,
  }
  return theme
end

return M
