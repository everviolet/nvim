local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  local cfg = config.integrations.indent_blankline
  return {
    IblIndent = { theme.surface0 },
    IblScope = { theme[cfg.scope_color] or theme.surface1 },
    RainbowRed = { theme.red, style = { 'nocombine' } },
    RainbowOrange = { theme.orange, style = { 'nocombine' } },
    RainbowYellow = { theme.yellow, style = { 'nocombine' } },
    RainbowGreen = { theme.green, style = { 'nocombine' } },
    RainbowAqua = { theme.aqua, style = { 'nocombine' } },
    RainbowBlue = { theme.blue, style = { 'nocombine' } },
    RainbowPurple = { theme.purple, style = { 'nocombine' } },
  }
end

return M
