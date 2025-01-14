---@class evergarden.types.styleconfig
---@field tabline evergarden.types.styleopt
---@field search evergarden.types.styleopt
---@field incsearch evergarden.types.styleopt
---@field types evergarden.types.styleopt
---@field keyword evergarden.types.styleopt
---@field comment evergarden.types.styleopt
---@field sign { highlight: boolean }

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
---@field syntax EvergardenSyntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: string }
---@field diff { ['add'|'delete'|'change']: string }
---@field git { ['staged'|'unstaged'|'ignored'|'untracked']: string }
---@field surface string
---@field sign string
---@field comment string

---@class EvergardenSyntax
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
  if not colors then
    colors = require('evergarden.colors').get()
  end
  if not config then
    config = require('evergarden.config').get()
  end
  ---@type evergarden.types.theme
  local theme = vim.deepcopy(colors, true)

  theme.none = 'NONE'
  theme.colors = colors

  theme.base = utils.vary_color {
    hard = colors.mantle,
    soft = colors.softbase,
  } or colors.base
  if config.transparent_background then
    theme.base = theme.none
  end

  theme.accent = theme.colors[config.accent] or theme.green
  theme.surface = utils.vary_color {
    hard = colors.base,
  } or colors.surface0
  theme.sign = config.style.sign.highlight and theme.surface or theme.none
  theme.comment = theme.overlay2

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
