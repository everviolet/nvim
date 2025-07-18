---@module 'evergarden.theme'

---@class evergarden.types.theme
---@field none string -- 'NONE'
---@field colors evergarden.types.colors -- copy of colors
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
---@field lime string
---@field green string
---@field aqua string
---@field skye string
---@field snow string
---@field blue string
---@field purple string
---@field pink string
---@field cherry string
---@field accent string
---@field editor evergarden.types.editor
---@field syntax evergarden.types.syntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: string }
---@field diff { ['add'|'delete'|'change']: string }
---@field git { ['staged'|'unstaged'|'ignored'|'untracked']: string }
---@field sign string
---@field comment string

--- colors for different ui elements in the editor
---@class evergarden.types.editor
---@field search string
---@field incsearch string
---@field float string
---@field completion string

--- color definitions for syntax groups
---@class evergarden.types.syntax
---@field keyword string
---@field identifier string
---@field property string
---@field type string
---@field context string
---@field operator string
---@field constant string
---@field func string
---@field string string
---@field macro string
---@field annotation string

local M = {}

---@param config? evergarden.types.config
---@param colors? evergarden.types.colors
---@return evergarden.types.theme
function M.setup(config, colors)
  config = config or require('evergarden.config').get()
  colors = colors or require('evergarden.colors').get(config)
  ---@type evergarden.types.theme
  local theme = vim.deepcopy(colors, true)

  theme.none = 'NONE'
  theme.colors = colors

  theme.accent = theme.colors[config.theme.accent] or theme.green
  theme.sign = theme.colors[config.editor.sign.color] or theme.none
  theme.comment = theme.overlay2

  theme.editor = {
    search = theme.snow,
    incsearch = theme.orange,
    float = theme.colors[config.editor.float.color] or theme.none,
    completion = theme.colors[config.editor.completion.color] or theme.none,
  }
  theme.syntax = {
    keyword = theme.red,
    identifier = theme.text,
    property = theme.skye,
    type = theme.yellow,
    context = theme.overlay1,
    operator = theme.subtext0,
    constant = theme.pink,
    func = theme.green,
    string = theme.lime,
    macro = theme.cherry,
    annotation = theme.cherry,
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
