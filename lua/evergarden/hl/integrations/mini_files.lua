local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  return {
    ['MiniFilesNormal'] = { link = 'NormalFloat' },
    ['MiniFilesCursorLine'] = { link = 'CursorLine' },

    ['MiniFilesDirectory'] = { link = 'Directory' },
    ['MiniFilesFile'] = { theme.syntax.object },

    ['MiniFilesBorder'] = { link = 'FloatBorder' },
    ['MiniFilesBorderModified'] = { theme.diagnostic.warn },

    ['MiniFilesTitle'] = { link = 'MiniFilesBorder' },
    ['MiniFilesTitleFocused'] = { link = 'FloatTitle' },
  }
end

return M
