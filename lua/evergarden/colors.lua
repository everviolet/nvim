---@type evergarden.types.colors
_G.evergarden_colors = {
  text = '#DDDECF',
  subtext1 = '#CACCBE',
  subtext0 = '#94AAA0',
  overlay2 = '#768C88',
  overlay1 = '#6E8585',
  overlay0 = '#5E6C70',
  surface2 = '#46565B',
  surface1 = '#3F4D52',
  surface0 = '#313C40',
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

local M = {}

function M.colors()
  return _G.evergarden_colors
end

---@param config evergarden.types.config?
---@return evergarden.types.theme
function M.setup(config)
  ---@type evergarden.types.config
  config = vim.tbl_extend('force', _G.evergarden_config, config or {})
  return require('evergarden.theme').setup(M.colors(), config)
end

return M
