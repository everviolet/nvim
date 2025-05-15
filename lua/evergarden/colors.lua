---@module 'evergarden.colors'

local M = {}

---@type evergarden.types.colors
M.colors = {
  red = '#F57F82',
  orange = '#F7A182',
  yellow = '#F5D098',
  lime = '#DBE6AF',
  green = '#CAE0A7',
  aqua = '#ADDEB9',
  skye = '#ACE0D4',
  snow = '#AFDFE6',
  blue = '#B2CFED',
  purple = '#D0BBF0',
  pink = '#F3C0E5',
  cherry = '#F6CEE5',
}

---@type evergarden.types.colors
M.fall = {
  text = '#F8F9E8',
  subtext1 = '#ADC9BC',
  subtext0 = '#96B4AA',
  overlay2 = '#839E9A',
  overlay1 = '#6F8788',
  overlay0 = '#58686D',
  surface2 = '#4A585C',
  surface1 = '#3D494D',
  surface0 = '#313B40',
  base = '#232A2E',
  mantle = '#1C2225',
  crust = '#171C1F',
}

---@type evergarden.types.colors
M.winter = {
  surface0 = '#2D393D',
  base = '#1D2428',
  mantle = '#191E21',
}

---@type evergarden.types.colors
M.spring = {
  base = '#2B3538',
  mantle = M.fall.base,
  crust = M.fall.mantle,
}

---@type evergarden.types.colors
M.summer = {
  red = '#C0696B',
  orange = '#CA8C70',
  yellow = '#CBAE75',
  lime = '#B4C17F',
  green = '#A9BE88',
  aqua = '#91BB9C',
  skye = '#8FBAB5',
  snow = '#8EB4BA',
  blue = '#8CA4BB',
  purple = '#B19AC6',
  pink = '#D0A3C3',
  cherry = '#DBB5CA',
  text = '#171C1F',
  subtext1 = '#415055',
  subtext0 = '#526469',
  overlay2 = '#63787D',
  overlay1 = '#758A90',
  overlay0 = '#879DA4',
  surface2 = '#9CB2B8',
  surface1 = '#B4C6CC',
  surface0 = '#CED9E0',
  base = '#E9EBF0',
  mantle = '#E1E5ED',
  crust = '#D6DBE9',
}

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get_shades(cfg)
  cfg = cfg or require('evergarden.config').get()
  local shades = M.fall
  if cfg.theme.variant == 'winter' then
    shades = vim.tbl_extend('force', shades, M.winter)
  elseif cfg.theme.variant == 'spring' then
    shades = vim.tbl_extend('force', shades, M.spring)
  elseif cfg.theme.variant == 'summer' then
    shades = vim.tbl_extend('force', shades, M.summer)
  end
  return shades
end

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get(cfg)
  cfg = cfg or require('evergarden.config').get()
  local shades = M.get_shades(cfg)
  local colors = vim.tbl_extend('force', M.colors, shades)
  return vim.tbl_deep_extend('force', colors, cfg.color_overrides)
end

return M
