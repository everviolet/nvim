local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  local cfg = config.integrations.indent_blankline
  return {
    IblIndent = { theme.surface0 },
    IblScope = { theme[cfg.scope_color] or theme.surface1 },
    RainbowRed = { theme.colors.red, style = { 'nocombine' } },
    RainbowOrange = { theme.colors.orange, style = { 'nocombine' } },
    RainbowYellow = { theme.colors.yellow, style = { 'nocombine' } },
    RainbowGreen = { theme.colors.green, style = { 'nocombine' } },
    RainbowAqua = { theme.colors.aqua, style = { 'nocombine' } },
    RainbowBlue = { theme.colors.blue, style = { 'nocombine' } },
    RainbowPurple = { theme.colors.purple, style = { 'nocombine' } },
  }
end

return M
