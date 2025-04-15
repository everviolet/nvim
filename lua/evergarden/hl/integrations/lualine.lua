local M = {}

M.theme = nil
M.config = nil

---@param theme evergarden.types.theme
---@param config evergarden.types.config }
M.get = function(theme, config)
  M.theme = theme
  M.config = config
  return {}
end

M.get_theme = function()
  local config = M.config or require('evergarden.config').get()
  local theme = M.theme or require('evergarden.theme').setup(config)

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
end

return M
