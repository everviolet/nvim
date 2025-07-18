local M = {}

---@param theme evergarden.types.theme
---@param _ evergarden.types.config
M.get = function(theme, _)
  return {
    ['TelescopeNormal'] = { link = 'PickNormal' },
    ['TelescopePromptPrefix'] = { link = 'TelescopePromptNormal' },
    ['TelescopePromptNormal'] = { link = 'PickPrompt' },
    ['TelescopeSelection'] = { link = 'PickSel' },
    ['TelescopeSelectionCaret'] = { link = 'PickPointer' },
    ['TelescopeMatching'] = { link = 'PickMatch' },
    ['TelescopeTitle'] = { link = 'PickTitle' },
    ['TelescopeBorder'] = { link = 'PickBorder' },
    ['TelescopePromptBorder'] = { link = 'TelescopeBorder' },
    ['TelescopeResultsBorder'] = { link = 'TelescopeBorder' },
    ['TelescopePreviewBorder'] = { link = 'TelescopeBorder' },
  }
end

return M
