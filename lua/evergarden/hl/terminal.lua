---@param theme? evergarden.types.theme
return function(theme)
  theme = theme or require('evergarden.theme').setup()

  vim.g.terminal_color_0 = theme.surface1
  vim.g.terminal_color_1 = theme.red
  vim.g.terminal_color_2 = theme.green
  vim.g.terminal_color_3 = theme.yellow
  vim.g.terminal_color_4 = theme.blue
  vim.g.terminal_color_5 = theme.pink
  vim.g.terminal_color_6 = theme.aqua
  vim.g.terminal_color_7 = theme.subtext0
  vim.g.terminal_color_8 = theme.overlay1
  vim.g.terminal_color_9 = theme.red
  vim.g.terminal_color_10 = theme.green
  vim.g.terminal_color_11 = theme.yellow
  vim.g.terminal_color_12 = theme.blue
  vim.g.terminal_color_13 = theme.pink
  vim.g.terminal_color_14 = theme.aqua
  vim.g.terminal_color_15 = theme.subtext1
end
