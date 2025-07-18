local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    FzfLuaNormal = { link = 'PickNormal' },
    FzfLuaBorder = { link = 'PickBorder' },
    FzfLuaTitle = { link = 'PickTitle' },
    FzfLuaTitleFlags = { link = 'PickTitle' },
    FzfLuaBackdrop = { link = 'FloatShadow' },

    FzfLuaBufName = { link = 'Title' },
    FzfLuaBufId = { link = '@number' },
    FzfLuaBufNr = { link = '@number' },
    FzfLuaBufFlagCur = { link = 'Special' },
    FzfLuaBufFlagAlt = { link = 'Special' },

    FzfLuaTabTitle = { link = 'Title' },
    FzfLuaTabMarker = { link = '@attribute' },

    FzfLuaPathLineNr = { link = '@number' },
    FzfLuaPathColNr = { link = '@number' },

    FzfLuaFzfCursorLine = { link = 'PickSel' },
    FzfLuaFzfMatch = { link = 'PickMatch' },
    FzfLuaFzfPointer = { link = 'PickPointer' },
    FzfLuaFzfMarker = { link = 'PickMarker' },
    FzfLuaFzfPrompt = { link = 'PickPrompt' },
  }
end

return M
