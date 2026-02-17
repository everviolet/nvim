---@module 'evergarden.ansi'

local M = {}

---@type evergarden.types.colors
M.colors = {
  red = 210,
  orange = 216,
  yellow = 222,
  lime = 230,
  green = 187,
  aqua = 151,
  skye = 152,
  snow = 153,
  blue = 154,
  purple = 183,
  pink = 218,
  cherry = 224,
}

---@type evergarden.types.colors
M.fall = {
  text = 255,
  subtext1 = 152,
  subtext0 = 109,
  overlay2 = 244,
  overlay1 = 243,
  overlay0 = 242,
  surface2 = 240,
  surface1 = 238,
  surface0 = 236,
  base = 235,
  mantle = 232,
  crust = 0,
}

---@type evergarden.types.colors
M.winter = {
  -- surface0 = '#262F33',
  -- base = '#1E2528',
  -- mantle = '#191E21',
}

---@type evergarden.types.colors
M.spring = {
  -- surface1 = '#3E4A4F',
  -- surface0 = '#343E43',
  -- base = '#2B3438',
  -- mantle = M.fall.base,
  -- crust = M.fall.mantle,
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

return M
