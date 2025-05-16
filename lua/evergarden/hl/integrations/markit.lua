local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    MarkSignHL = { theme.overlay1 },
    MarkSignNumHL = { theme.overlay0 },
  }
end

return M
