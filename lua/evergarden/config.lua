local M = {}

---@type evergarden.types.config
M.default = {
  transparent_background = false,
  variant = 'medium',
  accent = 'green',
  override_terminal = true,
  style = {
    tabline = { 'reverse' },
    search = { 'italic' },
    incsearch = { 'reverse' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
    sign = { highlight = false },
  },
  integrations = {
    blink_cmp = true,
    cmp = true,
    gitsigns = true,
    indent_blankline = { enable = true, scope_color = 'green' },
    nvimtree = true,
    rainbow_delimiters = true,
    symbols_outline = true,
    telescope = true,
    which_key = true,
    neotree = true,
  },
  overrides = {},
  color_overrides = {},
}

---@type evergarden.types.config
M.config = {}

---@return evergarden.types.config
function M.get()
  return vim.tbl_deep_extend('force', M.default, M.config)
end

---@param cfg evergarden.types.config
---@return evergarden.types.config
function M.override(cfg)
  return vim.tbl_deep_extend('force', M.default, cfg)
end

---@param cfg evergarden.types.config
function M.set(cfg)
  M.config = cfg
end

return M
