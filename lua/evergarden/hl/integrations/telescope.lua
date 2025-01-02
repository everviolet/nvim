local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['TelescopeNormal'] = { theme.subtext1 },
    ['TelescopePromptPrefix'] = { theme.pink },
    ['TelescopePromptNormal'] = { link = 'TelescopeNormal' },
    ['TelescopeSelection'] = { theme.none, theme.surface1 },
    ['TelescopeSelectionCaret'] = { theme.yellow, theme.surface1 },
    ['TelescopeMatching'] = { link = 'Search' },
    ['TelescopeTitle'] = { link = 'FloatTitle' },
    ['TelescopeBorder'] = { link = 'FloatBorder' },
    ['TelescopePromptBorder'] = { link = 'TelescopeBorder' },
    ['TelescopeResultsBorder'] = { link = 'TelescopeBorder' },
    ['TelescopePreviewBorder'] = { link = 'TelescopeBorder' },
  }
end

return M
