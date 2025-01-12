local theme = require('evergarden.theme').setup()

local colors = {
  normal = theme.green,
  insert = theme.text,
  visual = theme.syntax.constant,
}

local evergarden = {}

evergarden.normal = {
  a = { fg = theme.crust, bg = colors.normal },
  b = { bg = theme.surface, fg = colors.normal },
  c = { bg = theme.base, fg = theme.overlay2 },
}

evergarden.insert = {
  a = { fg = theme.crust, bg = colors.insert },
  b = { bg = theme.surface, fg = colors.insert },
}

evergarden.command = evergarden.normal

evergarden.visual = {
  a = { fg = theme.crust, bg = colors.visual },
  b = { bg = theme.surface, fg = colors.visual },
}

evergarden.replace = evergarden.insert

evergarden.inactive = {
  a = { bg = theme.base, fg = theme.overlay1 },
  b = { bg = theme.base, fg = theme.overlay1 },
  c = { bg = theme.base, fg = theme.overlay1 },
}

return evergarden
