local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['TelescopeNormal'] = { theme.syntax.context },
    ['TelescopePromptPrefix'] = { link = 'Constant' },
    ['TelescopePromptNormal'] = { 'none', 'none' },
    ['TelescopeSelection'] = { 'none', theme.surface0 },
    ['TelescopeSelectionCaret'] = { link = 'TelescopeNormal' },
    ['TelescopeMatching'] = { link = 'Search' },
    ['TelescopeTitle'] = { link = 'FloatTitle' },
    ['TelescopeBorder'] = { link = 'FloatBorder' },
    ['TelescopePromptBorder'] = { link = 'TelescopeBorder' },
    ['TelescopeResultsBorder'] = { link = 'TelescopeBorder' },
    ['TelescopePreviewBorder'] = { link = 'TelescopeBorder' },
  }
end

return M
