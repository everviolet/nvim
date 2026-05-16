local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
M.get = function(theme, config)
  return {
    ['ArtioNormal'] = { link = 'Panel' },
    ['ArtioSel'] = { link = 'PickSel' },
    ['ArtioMatch'] = { link = 'PickMatch' },
    ['ArtioPointer'] = { link = 'PickPointer' },
    ['ArtioPrompt'] = { link = 'PickPrompt' },
  }
end

return M
