local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
M.get = function(theme, config)
  local cfg = config.integrations.indent_blankline
  return {
    IblIndent = { theme.surface0 },
    IblScope = { theme[cfg.scope_color] or theme.surface1 },
    ['RainbowRed'] = { theme.colors.red, nocombine = true },
    ['RainbowOrange'] = { theme.colors.orange, nocombine = true },
    ['RainbowYellow'] = { theme.colors.yellow, nocombine = true },
    ['RainbowGreen'] = { theme.colors.green, nocombine = true },
    ['RainbowAqua'] = { theme.colors.aqua, nocombine = true },
    ['RainbowBlue'] = { theme.colors.blue, nocombine = true },
    ['RainbowPurple'] = { theme.colors.purple, nocombine = true },
  }
end

return M
