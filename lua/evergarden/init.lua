local evergarden = {}

---@type evergarden.types.config
evergarden.default_config = {
  transparent_background = false,
  contrast_dark = 'medium',
  override_terminal = true,
  style = {
    tabline = { reverse = true, color = 'green' },
    search = { reverse = false, inc_reverse = true },
    types = { italic = true },
    keyword = { italic = true },
    comment = { italic = false },
    sign = { highlight = false },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    indent_blankline = true,
    nvimtree = true,
    rainbow_delimiters = true,
    symbols_outline = true,
    telescope = true,
  },
  overrides = {},
}

---@type evergarden.types.config
_G.evergarden_config = vim.tbl_deep_extend(
  'force',
  evergarden.default_config,
  _G.evergarden_config or {}
)

---@param config evergarden.types.config|table
function evergarden.setup(config)
  _G.evergarden_config =
    vim.tbl_deep_extend('force', _G.evergarden_config, config or {})
end

---@param group string
---@param colors evergarden.types.colorspec
local function set_hi(group, colors)
  if type(colors) ~= 'table' or vim.tbl_isempty(colors) then
    return
  end

  colors.fg = colors.fg or colors[1] or 'none'
  colors.bg = colors.bg or colors[2] or 'none'

  ---@type vim.api.keyset.highlight
  local color = vim.deepcopy(colors)

  color.fg = colors.fg
  color.bg = colors.bg
  color[1] = nil
  color[2] = nil
  ---@diagnostic disable-next-line: inject-field
  color.name = nil

  vim.api.nvim_set_hl(0, group, color)
end

---@param hlgroups evergarden.types.hlgroups
local function set_highlights(hlgroups)
  ---@type evergarden.types.colorspec
  local color = hlgroups.Normal
  local normal = {}
  normal.fg = color.fg or color[1] or 'none'
  normal.bg = color.bg or color[2] or 'none'
  vim.api.nvim_set_hl(0, 'Normal', normal)
  hlgroups.Normal = nil
  for group, colors in pairs(hlgroups) do
    set_hi(group, colors)
  end
end

function evergarden.load(opts)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'evergarden'
  vim.o.termguicolors = true

  -- if vim.o.background == 'light' then
  --     _G.evergarden_config.theme = 'light'
  -- elseif vim.o.background == 'dark' then
  --     _G.evergarden_config.theme = 'default'
  -- end
  local cfg = vim.tbl_deep_extend('force', _G.evergarden_config, opts)

  local theme = require('evergarden.colors').setup(cfg)
  local hlgroups = require('evergarden.hl.init').setup(theme, cfg)

  set_highlights(hlgroups)
end

function evergarden.colors()
  return require('evergarden.colors').colors()
end

return evergarden
