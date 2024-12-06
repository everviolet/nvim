local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['@ibl.indent.char.1'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.2'] = { theme.colors.red, nocombine = true },
    ['@ibl.indent.char.3'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.4'] = { theme.colors.orange, nocombine = true },
    ['@ibl.indent.char.5'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.6'] = { theme.colors.yellow, nocombine = true },
    ['@ibl.indent.char.7'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.8'] = { theme.colors.green, nocombine = true },
    ['@ibl.indent.char.9'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.10'] = { theme.colors.aqua, nocombine = true },
    ['@ibl.indent.char.11'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.12'] = { theme.colors.blue, nocombine = true },
    ['@ibl.indent.char.13'] = { theme.surface1, nocombine = true },
    ['@ibl.indent.char.14'] = { theme.colors.purple, nocombine = true },
  }
end

return M
