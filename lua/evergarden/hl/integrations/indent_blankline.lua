local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  local cfg = config.integrations.indent_blankline
  return {
    IblIndent = { theme.surface0 },
    IblScope = { theme[cfg.scope_color] or theme.surface1 },
  }
end

return M
