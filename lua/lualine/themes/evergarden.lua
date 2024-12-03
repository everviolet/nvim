local theme = require('evergarden.colors').setup()

local colors = {
  normal = theme.green,
  insert = theme.text,
  visual = theme.syntax.constant,
}

local evergarden = {}

evergarden.normal = {
  a = { fg = theme.crust, bg = colors.normal },
  b = { bg = theme.surface0, fg = colors.normal },
  c = { bg = theme.crust, fg = theme.overlay2 },
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
  a = { bg = theme.crust, fg = theme.overlay1 },
  b = { bg = theme.crust, fg = theme.overlay1 },
  c = { bg = theme.crust, fg = theme.overlay1 },
}

return evergarden
