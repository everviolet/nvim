local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups
M.get = function(theme, config)
  local cfg = config.integrations.mini
  if not cfg then
    return {}
  end

  local hlgroups = {}

  if cfg.files then
    table.insert(hlgroups, {
      MiniFilesNormal = { link = 'NormalFloat' },
      MiniFilesCursorLine = { link = 'CursorLine' },

      MiniFilesDirectory = { link = 'Directory' },
      MiniFilesFile = { theme.syntax.object },

      MiniFilesBorder = { link = 'FloatBorder' },
      MiniFilesBorderModified = { theme.diagnostic.warn },

      MiniFilesTitle = { link = 'MiniFilesBorder' },
      MiniFilesTitleFocused = { link = 'FloatTitle' },
    })
  end

  if cfg.pick then
    table.insert(hlgroups, {
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
    })
  end

  return hlgroups
end

return M
