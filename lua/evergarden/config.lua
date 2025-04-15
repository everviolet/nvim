local M = {}

---@type evergarden.types.config
M.default = {
  theme = {
    variant = 'fall',
    accent = 'green',
  },
  editor = {
    transparent_background = false,
    override_terminal = true,
    sign = { color = 'none' },
    float = {
      color = 'mantle',
      invert_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
  style = {
    tabline = { 'reverse' },
    search = { 'italic', 'reverse' },
    incsearch = { 'italic', 'reverse' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
  },
  integrations = {
    blink_cmp = true,
    cmp = true,
    fzf_lua = true,
    gitsigns = true,
    indent_blankline = { enable = true, scope_color = 'green' },
    lualine = true,
    mini = {
      enable = true,
      animate = true,
      clue = true,
      completion = true,
      cursorword = true,
      deps = true,
      diff = true,
      files = true,
      hipatterns = true,
      icons = true,
      indentscope = true,
      jump = true,
      jump2d = true,
      map = true,
      notify = true,
      operators = true,
      pick = true,
      starters = true,
      statusline = true,
      surround = true,
      tabline = true,
      test = true,
      trailspace = true,
    },
    nvimtree = true,
    rainbow_delimiters = true,
    semantic_tokens = true,
    symbols_outline = true,
    telescope = true,
    which_key = true,
    neotree = true,
  },
  overrides = {},
  color_overrides = {},
}

---@type evergarden.types.config
---@diagnostic disable-next-line: missing-fields
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
