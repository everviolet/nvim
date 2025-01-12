local M = {}

---@type evergarden.types.colors
M.colors = {
  text = '#DDDECF',
  subtext1 = '#CACCBE',
  subtext0 = '#94AAA0',
  overlay2 = '#839E9A',
  overlay1 = '#738A8B',
  overlay0 = '#617377',
  surface2 = '#4F5E62',
  surface1 = '#3D494D',
  surface0 = '#313B40',
  base = '#232A2E',
  mantle = '#1C2225',
  crust = '#171C1F',
  softbase = '#2B3538',
  red = '#E67E80',
  orange = '#E69875',
  yellow = '#DBBC7F',
  green = '#B2C98F',
  aqua = '#93C9A1',
  skye = '#97C9C3',
  blue = '#9BB5CF',
  purple = '#D6A0D1',
  pink = '#E3A8D1',
}

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get(cfg)
  cfg = cfg or require('evergarden.config').get()
  return vim.tbl_deep_extend('force', M.colors, cfg.color_overrides)
end

return M
