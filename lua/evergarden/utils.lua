local M = {}

---@param group string
---@param colors evergarden.types.colorspec
local function set_hl(group, colors)
  if type(colors) ~= 'table' or vim.tbl_isempty(colors) then
    return
  end

  colors.fg = colors.fg or colors[1] or 'none'
  colors.bg = colors.bg or colors[2] or 'none'

  ---@type vim.api.keyset.highlight
  local color = {
    fg = colors.fg,
    bg = colors.bg,
    link = colors.link,
    blend = colors.blend,
  }

  local styles = vim
    .iter(ipairs(colors.style or {}))
    :fold({}, function(acc, _, style)
      acc[style] = true
      return acc
    end)

  color = vim.tbl_extend('force', color, styles)

  vim.api.nvim_set_hl(0, group, color)
end

---@param hlgroups evergarden.types.hlgroups
function M.set_highlights(hlgroups)
  ---@type evergarden.types.colorspec
  local color = hlgroups.Normal
  if not color then
    return
  end
  set_hl('Normal', color)
  hlgroups.Normal = nil

  for group, colors in pairs(hlgroups) do
    set_hl(group, colors)
  end
end

---@param props { evergarden.types }
function M.vary_color(props)
  if not props then
    return
  end
  if props[evergarden_config.variant] then
    return props[evergarden_config.variant]
  elseif props.medium then
    return props.medium
  else
    return nil
  end
end

return M
