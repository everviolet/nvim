local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['GitGutterAdd'] = { theme.diff.add, theme.sign },
    ['GitGutterChange'] = { theme.diff.change, theme.sign },
    ['GitGutterDelete'] = { theme.diff.delete, theme.sign },
    ['GitGutterChangeDelete'] = { link = 'GitGutterChange' },
  }
end

return M
