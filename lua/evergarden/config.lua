---@module 'evergarden.config'

--- for default options see |evergarden.config.default|
---@tag evergarden.config
---@class evergarden.types.config
---@field theme evergarden.types.config.theme -- |evergarden.config.theme|
---@field editor evergarden.types.config.editor -- |evergarden.config.editor|
---@field cache? boolean -- |evergarden.cache|
---@field style? evergarden.types.styleconfig -- |evergarden.styleconfig|
---@field integrations? evergarden.types.config.integrations -- |evergarden.integrations|
---@field color_overrides? evergarden.types.colors
---@usage
--- twilight variant:
--- >lua
---  color_overrides = {
---    base = '#151A1D',
---    mantle = '#13171A',
---    crust = '#0F1214',
---  },
--- <
---@field overrides? evergarden.types.hlgroups|fun(theme: evergarden.types.theme): evergarden.types.hlgroups
---@usage
--- >lua
---  overrides = {
---    Normal = {
---      '#fddce3',
---      '#1d2021',
---
---      -- Additional highlight options can be included here
---      style = { 'bold', 'italic' }
---    },
---    Keyword = {
---      fg = '#ce96de',
---      bg = '#ae45be',
---    },
---  },
--- <
--- or use a function to gain access to the theme colors:
--- >lua
---  overrides = function(colors)
---    return {
---      Normal = {
---        fg = colors.text,
---        bg = colors.crust,
---      },
---      Keyword = {
---        fg = colors.purple,
---      },
---    }
---  end
--- <

---@tag evergarden.config.theme
---@class evergarden.types.config.theme
---@field variant? evergarden.types.variant
---@field accent? evergarden.types.colors.enum

---@tag evergarden.config.editor
---@class evergarden.types.config.editor
---@field transparent_background? boolean
---@field override_terminal? boolean
---@field sign? { color: evergarden.types.colors.enum|'none' }
---@field float? { color: evergarden.types.colors.enum|'none', solid_border: boolean }
---@field completion? { color: evergarden.types.colors.enum|'none', selected: { color: evergarden.types.colors.enum|'none', style: evergarden.types.styleopt } }

---@tag evergarden.styleconfig
---@class evergarden.types.styleconfig
---@field tabline evergarden.types.styleopt
---@field search evergarden.types.styleopt
---@field incsearch evergarden.types.styleopt
---@field diagnostics evergarden.types.styleopt
---@field types evergarden.types.styleopt
---@field keyword evergarden.types.styleopt
---@field comment evergarden.types.styleopt
---@field spell evergarden.types.styleopt
---@usage
--- >lua
---  style = {
---    tabline = { 'reverse' },
---    search = { 'italic', 'reverse' },
---    incsearch = { },
---    diagnostics = { 'undercurl' },
---    types = { 'italic' },
---    keyword = { 'italic' },
---    comment = { 'italic' },
---    spell = { 'underdotted' },
---  },
--- <

---@tag evergarden.integrations
---@class evergarden.types.config.integrations
---@field artio? boolean comfysage/artio.nvim
---@field blink_cmp? boolean Saghen/blink.cmp
---@field bqf? boolean kevinhwang91/nvim-bqf
---@field cmp? boolean hrsh7th/nvim-cmp
---@field fzf_lua? boolean ibhagwan/fzf-lua
---@field gitsigns? boolean lewis6991/gitsigns.nvim
---@field indent_blankline? { enable: boolean, scope_color: evergarden.types.colors.enum } lukas-reineke/indent-blankline.nvim
---@field lualine? boolean nvim-lualine/lualine.nvim
---@field markit? boolean
---@field mini? evergarden.types.config.integrations.mini echasnovski/mini.nvim
---@field neotree? boolean nvim-neo-tree/neo-tree.nvim
---@field nvimtree? boolean nvim-tree/nvim-tree.lua
---@field rainbow_delimiters? boolean hiphish/rainbow-delimiters.nvim
---@field semantic_tokens? boolean
---@field symbols_outline? boolean simrat39/symbols-outline.nvim
---@field telescope? boolean nvim-telescope/telescope.nvim
---@field which_key? boolean folke/which-key.nvim

--- allows enabling integrations for different mini plugins
---@class evergarden.types.config.integrations.mini
---@field enable boolean
---@field animate boolean
---@field clue boolean
---@field completion boolean
---@field cursorword boolean
---@field deps boolean
---@field diff boolean
---@field files boolean
---@field hipatterns boolean
---@field icons boolean
---@field indentscope boolean
---@field jump boolean
---@field jump2d boolean
---@field map boolean
---@field notify boolean
---@field operators boolean
---@field pick boolean
---@field starters boolean
---@field statusline boolean
---@field surround boolean
---@field tabline boolean
---@field test boolean
---@field trailspace boolean

local M = {}

---@type evergarden.types.config
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
---@text # Default ~
M.default = {
  theme = {
    --minidoc_replace_start variant = 'winter'|'fall'|'spring'|'summer'
    variant = 'fall',
    --minidoc_replace_end
    accent = 'green',
  },
  editor = {
    transparent_background = false,
    override_terminal = true,
    sign = { color = 'none' },
    float = {
      --- background color used for floating windows
      color = 'mantle',
      solid_border = false,
    },
    completion = {
      --- background color used for completion windows
      color = 'mantle',
      selected = {
        color = 'surface0',
        style = { 'bold' },
      },
    },
  },
  style = {
    tabline = { 'reverse' },
    search = { 'italic', 'reverse' },
    incsearch = {},
    diagnostics = { 'undercurl' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
    spell = { 'underdotted' },
  },
  integrations = {
    artio = true,
    blink_cmp = true,
    bqf = true,
    cmp = true,
    fzf_lua = true,
    gitsigns = true,
    indent_blankline = { enable = true, scope_color = 'green' },
    lualine = true,
    markit = true,
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
    neotree = true,
    nvimtree = true,
    rainbow_delimiters = true,
    semantic_tokens = true,
    symbols_outline = true,
    telescope = true,
    which_key = true,
  },
  overrides = {},
  color_overrides = {},
  cache = true,
}
--minidoc_afterlines_end

---@type evergarden.types.config
---@diagnostic disable-next-line: missing-fields
M.config = {}

---@private
---@generic T: table|any[]
---@param tdefault T
---@param toverride T
---@return T
local function tmerge(tdefault, toverride)
  if toverride == nil then
    return tdefault
  end

  if vim.islist(tdefault) then
    return toverride
  end
  if vim.tbl_isempty(tdefault) then
    return toverride
  end

  return vim.iter(pairs(tdefault)):fold({}, function(tnew, k, v)
    if toverride[k] == nil or type(v) ~= type(toverride[k]) then
      tnew[k] = v
      return tnew
    end
    if type(v) == 'table' then
      tnew[k] = tmerge(v, toverride[k])
      return tnew
    end

    tnew[k] = toverride[k]
    return tnew
  end)
end

---@param tdefault evergarden.types.config
---@param toverride evergarden.types.config
---@return evergarden.types.config
function M.merge(tdefault, toverride)
  if vim.fn.has 'nvim-0.11.0' == 1 then
    toverride = vim.tbl_deep_extend(
      'keep',
      toverride,
      { editor = { float = { solid_border = vim.o.winborder == 'solid' } } }
    )
  end
  return tmerge(tdefault, toverride)
end

---@return evergarden.types.config
function M.get()
  return M.merge(M.default, M.config)
end

---@param cfg evergarden.types.config
---@return evergarden.types.config
function M.override(cfg)
  return M.merge(M.default, cfg)
end

---@param cfg evergarden.types.config
function M.set(cfg)
  M.config = cfg
end

return M
