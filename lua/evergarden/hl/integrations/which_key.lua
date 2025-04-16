local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    WhichKey = { theme.text }, -- key name

    WhichKeySeparator = { theme.overlay0 }, -- the separator between the key and its description
    WhichKeyGroup = { theme.subtext0 }, -- group name
    WhichKeyDesc = { theme.subtext0 }, -- description
    WhichKeyNormal = { link = 'NormalFloat' }, -- Normal in th which-key window
    WhichKeyTitle = { link = 'FloatTitle' }, -- Title of the which-key window
    WhichKeyBorder = { link = 'FloatBorder' }, -- Border of the which-key window
    WhichKeyValue = { theme.overlay0 }, -- values by plugins (like marks, registers, etc)
    WhichKeyIcon = { theme.overlay2 }, -- icons
    WhichKeyIconAzure = { theme.skye },
    WhichKeyIconBlue = { theme.blue },
    WhichKeyIconCyan = { theme.aqua },
    WhichKeyIconGreen = { theme.green },
    WhichKeyIconGrey = { theme.overlay2 },
    WhichKeyIconOrange = { theme.orange },
    WhichKeyIconPurple = { theme.purple },
    WhichKeyIconRed = { theme.red },
    WhichKeyIconYellow = { theme.yellow },
  }
end

return M
