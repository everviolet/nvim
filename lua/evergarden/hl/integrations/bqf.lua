local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    BqfPreviewFloat = { link = 'NormalFloat' },
    BqfPreviewBorder = { link = 'FloatBorder' },
    BqfPreviewTitle = { link = 'FloatTitle' },
  }
end

return M
