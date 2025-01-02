---@class evergarden.types.styleconfig
---@field tabline { reverse: boolean, color: evergarden.types.colors.enum }
---@field search { reverse: boolean, inc_reverse: boolean }
---@field types { italic: boolean }
---@field keyword { italic: boolean }
---@field comment { italic: boolean }
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
---@field syntax EvergardenSyntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: string }
---@field diff { ['add'|'delete'|'change']: string }
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

local utils = require('evergarden.utils')

local M = {}

---@param colors evergarden.types.colors
---@param config evergarden.types.config
---@return evergarden.types.theme
function M.setup(colors, config)
  ---@type evergarden.types.theme
  local theme = vim.deepcopy(colors, true)

  theme.none = 'NONE'
  theme.colors = colors

  theme.base = utils.vary_color({
    hard = colors.mantle,
    medium = colors.base,
    soft = colors.softbase,
  })
  if config.transparent_background then
    theme.base = theme.none
  end

  theme.sign = config.style.sign.highlight
      and utils.vary_color {
        hard = theme.base,
        medium = theme.surface0,
        soft = theme.surface1,
      }
    or theme.none
  theme.comment = theme.overlay2

  theme.red = colors.red
  theme.orange = colors.orange
  theme.yellow = colors.yellow
  theme.green = colors.green
  theme.aqua = colors.aqua
  theme.skye = colors.skye
  theme.blue = colors.blue
  theme.purple = colors.purple
  theme.pink = colors.pink

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
  return theme
end

return M
