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
  cherry = '#FAE6EF',
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
  red = '#C58687',
  orange = '#C69883',
  yellow = '#C4AA80',
  lime = '#ABB182',
  green = '#91A77A',
  aqua = '#74A48B',
  skye = '#719F96',
  snow = '#7799A3',
  blue = '#8294AD',
  purple = '#A897B8',
  pink = '#C499B8',
  cherry = '#C29FB2',
  text = '#2B3034',
  subtext1 = '#455355',
  subtext0 = '#576869',
  overlay2 = '#707D76',
  overlay1 = '#829084',
  overlay0 = '#ACB5A4',
  surface2 = '#CECCBD',
  surface1 = '#E6E1D3',
  surface0 = '#EDE8DD',
  base = '#F5EFE6',
  mantle = '#F2EAE1',
  crust = '#E8DED5',
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
