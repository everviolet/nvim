local theme = require('evergarden.theme').setup()
local config = require('evergarden.config').get()

local colors = {
  normal = theme.accent,
  insert = theme.text,
  visual = theme.syntax.constant,
}

local evergarden = {}

evergarden.normal = {
  a = { fg = theme.crust, bg = colors.normal },
  b = { bg = theme.surface0, fg = colors.normal },
  c = {
    bg = config.editor.transparent_background and theme.none or theme.base,
    fg = theme.overlay2,
  },
}

evergarden.insert = {
  a = { fg = theme.crust, bg = colors.insert },
  b = { bg = theme.surface0, fg = colors.insert },
}

evergarden.command = evergarden.normal

evergarden.visual = {
  a = { fg = theme.crust, bg = colors.visual },
  b = { bg = theme.surface0, fg = colors.visual },
}

evergarden.replace = evergarden.insert

evergarden.inactive = {
  a = { bg = theme.base, fg = theme.overlay1 },
  b = { bg = theme.base, fg = theme.overlay1 },
  c = {
    bg = config.editor.transparent_background and theme.none or theme.base,
    fg = theme.overlay1,
  },
}

return evergarden
