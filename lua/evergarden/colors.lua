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

---@type evergarden.types.colors
M.lunar = {
  red = '#EB7F86',
  orange = '#F5A58D',
  yellow = '#F7DDAF',
  lime = '#DBE3C7',
  green = '#C5D9B5',
  aqua = '#ACD1B6',
  skye = '#AAD0C9',
  snow = '#ADD1D8',
  blue = '#99B3D5',
  purple = '#A69FD5',
  pink = '#D6ABC3',
  cherry = '#E0C5D0',
  text = '#F7F1E6',
  subtext1 = '#CBD7F2',
  subtext0 = '#B4C0DB',
  overlay2 = '#9EA5C1',
  overlay1 = '#9096B1',
  overlay0 = '#757A93',
  surface2 = '#4C4F61',
  surface1 = '#353847',
  surface0 = '#21232E',
  base = '#1C1D29',
  mantle = '#171923',
  crust = '#11121A',
}

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get_shades(cfg)
  cfg = cfg or require('evergarden.config').get()
  local t = M
  if cfg.theme.ansi then
    t = require 'evergarden.ansi'
  end

  local shades = t.fall
  if cfg.theme.variant == 'winter' then
    shades = vim.tbl_extend('force', shades, t.winter)
  elseif cfg.theme.variant == 'spring' then
    shades = vim.tbl_extend('force', shades, t.spring)
  elseif cfg.theme.variant == 'summer' then
    shades = vim.tbl_extend('force', shades, t.summer)
  elseif cfg.theme.variant == 'lunar' then
    shades = vim.tbl_extend('force', shades, t.lunar)
  end
  return shades
end

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get(cfg)
  cfg = cfg or require('evergarden.config').get()
  local shades = M.get_shades(cfg)
  local colors = M.colors
  if cfg.theme.ansi then
    colors = require('evergarden.ansi').colors
  end
  local palette = vim.tbl_extend('force', colors, shades)
  return vim.tbl_deep_extend('force', palette, cfg.color_overrides)
end

return M
