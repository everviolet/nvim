local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    FzfLuaNormal = { link = 'NormalFloat' },
    FzfLuaBorder = { link = 'FloatBorder' },
    FzfLuaTitle = { link = 'FloatTitle' },
    FzfLuaTitleFlags = { link = '@attribute' },
    FzfLuaBackdrop = { theme.crust },
    FzfLuaBufName = { link = 'Title' },
    FzfLuaBufId = { link = '@number' },
    FzfLuaTabTitle = { link = 'Title' },
    FzfLuaTabMarker = { link = '@attribute' },

    FzfLuaFzfMatch = { link = 'IncSearch' },
    FzfLuaFzfPointer = { theme.accent },
    FzfLuaFzfMarker = { theme.yellow },
    FzfLuaFzfPrompt = { theme.pink },
  }
end

return M
