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
    FzfLuaBufNr = { link = '@number' },
    FzfLuaBufFlagCur = { link = 'Special' },
    FzfLuaBufFlagAlt = { link = 'Special' },

    FzfLuaTabTitle = { link = 'Title' },
    FzfLuaTabMarker = { link = '@attribute' },

    FzfLuaPathLineNr = { link = '@number' },
    FzfLuaPathColNr = { link = '@number' },

    FzfLuaFzfMatch = { theme.editor.search },
    FzfLuaFzfPointer = { theme.accent },
    FzfLuaFzfMarker = { theme.yellow },
    FzfLuaFzfPrompt = { theme.pink },
  }
end

return M
