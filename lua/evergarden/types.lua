---@alias evergarden.types.variant 'hard'|'medium'|'soft'

---@class evergarden.types.config
---@field transparent_background? boolean
---@field variant? evergarden.types.variant
---@field override_terminal? boolean
---@field style? evergarden.types.styleconfig
---@field integrations? evergarden.types.config.integrations
---@field color_overrides? evergarden.types.colors
---@field overrides? evergarden.types.hlgroups|fun(colors: evergarden.types.colors): evergarden.types.hlgroups

---@class evergarden.types.config.integrations
---@field blink_cmp? boolean Saghen/blink.cmp
---@field cmp? boolean hrsh7th/nvim-cmp
---@field gitsigns? boolean lewis6991/gitsigns.nvim
---@field indent_blankline? { enable: boolean, scope_color: evergarden.types.colors.enum } lukas-reineke/indent-blankline.nvim
---@field neotree? boolean nvim-neo-tree/neo-tree.nvim
---@field nvimtree? boolean nvim-tree/nvim-tree.lua
---@field rainbow_delimiters? boolean hiphish/rainbow-delimiters.nvim
---@field symbols_outline? boolean simrat39/symbols-outline.nvim
---@field telescope? boolean nvim-telescope/telescope.nvim
---@field which_key? boolean folke/which-key.nvim

---@alias evergarden.types.colors.enum 'crust'|'softbase'|'mantle'|'base'|'surface0'|'surface1'|'surface2'|'overlay0'|'overlay1'|'overlay2'|'subtext0'|'subtext1'|'text'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'skye'|'purple'|'pink'
---@alias evergarden.types.colors { [evergarden.types.colors.enum]: string }

---@class evergarden.types.colorspec
---@field fg? string
---@field bg? string
---@field link? string
---@field blend? integer
---@field style? evergarden.types.styleopt
---@field [1]? string
---@field [2]? string

---@alias evergarden.types.styleopt evergarden.types.styleopt.enum[]
---@alias evergarden.types.styleopt.enum 'bold'|'standout'|'underline'|'undercurl'|'underdouble'|'underdotted'|'underdashed'|'strikethrough'|'italic'|'reverse'|'nocombine'

---@alias evergarden.types.hlgroups { [string]: evergarden.types.colorspec }
