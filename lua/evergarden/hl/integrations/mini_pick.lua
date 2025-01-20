local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  return {
    MiniPickBorder = { link = 'FloatBorder' }, -- window border.
    MiniPickBorderBusy = { theme.diagnostic.warn }, -- window border while picker is busy processing.
    MiniPickBorderText = { theme.subtext0 }, -- non-prompt on border.
    MiniPickCursor = { theme.yellow }, -- cursor during active picker (hidden by default).
    MiniPickIconDirectory = { theme.overlay2 }, -- default icon for directory.
    MiniPickIconFile = { theme.subtext1 }, -- default icon for file.
    MiniPickHeader = { theme.subtext0 }, -- headers in info buffer and previews.
    MiniPickMatchCurrent = { link = 'CursorLine' }, -- current matched item.
    MiniPickMatchMarked = { link = 'Visual' }, -- marked matched items.
    MiniPickMatchRanges = { link = 'IncSearch' }, -- ranges matching query elements.
    MiniPickNormal = { link = 'NormalFloat' }, -- basic foreground/background highlighting.
    MiniPickPreviewLine = { link = 'Visual' }, -- target line in preview.
    MiniPickPreviewRegion = { link = 'CursorLine' }, -- target region in preview.
    MiniPickPrompt = { theme.pink }, -- prompt.
  }
end

return M
