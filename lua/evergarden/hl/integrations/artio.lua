local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
M.get = function(theme, config)
  return {
    ['ArtioNormal'] = {
      theme.text,
      config.editor.transparent_background and theme.none or theme.mantle,
    },
    ['ArtioSel'] = { link = 'PickSel' },
    ['ArtioMatch'] = { link = 'PickMatch' },
    ['ArtioPointer'] = { link = 'PickPointer' },
    ['ArtioPrompt'] = { link = 'PickPrompt' },
  }
end

return M
