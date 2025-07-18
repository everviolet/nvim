---@module 'evergarden.colors'

local M = {}

---@type evergarden.types.colors
M.colors = {
  red = '#F57F82',
  orange = '#F7A182',
  yellow = '#F5D098',
  lime = '#DBE6AF',
  green = '#CBE3B3',
  aqua = '#B3E3CA',
  skye = '#B3E6DB',
  snow = '#AFD9E6',
  blue = '#B2CAED',
  purple = '#D2BDF3',
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
  surface1 = '#374145',
  surface0 = '#2B3337',
  base = '#232A2E',
  mantle = '#1C2225',
  crust = '#171C1F',
}

---@type evergarden.types.colors
M.winter = {
  surface0 = '#262F33',
  base = '#1E2528',
  mantle = '#191E21',
}

---@type evergarden.types.colors
M.spring = {
  surface1 = '#3E4A4F',
  surface0 = '#343E43',
  base = '#2B3438',
  mantle = M.fall.base,
  crust = M.fall.mantle,
}

---@type evergarden.types.colors
M.summer = {
  red = '#B86466',
  orange = '#B88067',
  yellow = '#BD9C68',
  lime = '#A0A673',
  green = '#889F70',
  aqua = '#71A088',
  skye = '#6E9991',
  snow = '#7497A2',
  blue = '#798DA8',
  purple = '#9B87AD',
  pink = '#B881A8',
  cherry = '#C29FB2',
  text = '#2B3034',
  subtext1 = '#455355',
  subtext0 = '#576869',
  overlay2 = '#707D76',
  overlay1 = '#829084',
  overlay0 = '#A3AB9B',
  surface2 = '#C2C6B3',
  surface1 = '#EDEAD8',
  surface0 = '#F0ECDF',
  base = '#F5F1EB',
  mantle = '#F0EAE4',
  crust = '#E8E0D5',
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
