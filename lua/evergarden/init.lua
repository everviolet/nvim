local evergarden = {}

---@type evergarden.types.config
evergarden.default_config = {
  transparent_background = false,
  variant = 'medium',
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
    indent_blankline = { enable = true, scope_color = 'green' },
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

---@param config? evergarden.types.config|table
function evergarden.setup(config)
  _G.evergarden_config =
    vim.tbl_deep_extend('force', _G.evergarden_config, config or {})
end

---@param config? evergarden.types.config|table
function evergarden.load(config)
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
  local cfg = vim.tbl_deep_extend('force', _G.evergarden_config, config or {})

  local theme = require('evergarden.colors').setup(cfg)
  local hlgroups = require('evergarden.hl.init').setup(theme, cfg)

  require('evergarden.utils').set_highlights(hlgroups)
end

function evergarden.colors()
  return require('evergarden.colors').colors()
end

return evergarden
