---@class evergarden.types.config
---@field transparent_background? boolean
---@field contrast_dark? 'hard'|'medium'|'soft'
---@field override_terminal? boolean
---@field style? evergarden.types.styleconfig
---@field integrations? evergarden.types.config.integrations
---@field overrides? evergarden.types.hlgroups

---@class evergarden.types.config.integrations
---@field cmp? boolean
---@field gitsigns? boolean
---@field indent_blankline? boolean lukas-reineke/indent-blankline.nvim
---@field nvimtree? boolean
---@field rainbow_delimiters? boolean
---@field telescope? boolean
---@field symbols_outline? boolean simrat39/symbols-outline.nvim

---@alias evergarden.types.colors.enum 'crust'|'softbase'|'mantle'|'base'|'surface0'|'surface1'|'surface2'|'overlay0'|'overlay1'|'overlay2'|'subtext0'|'subtext1'|'text'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'skye'|'purple'|'pink'
---@alias evergarden.types.colors { [evergarden.types.colors.enum]: string }
