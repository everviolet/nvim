--- *evergarden*
--- cozy evergarden theme for neovim
---
--- for configuration see |evergarden.config|
---@module 'evergarden'

local config = require 'evergarden.config'

local evergarden = {}

--- for configuration see |evergarden.config|
---@param cfg? evergarden.types.config|table
function evergarden.setup(cfg)
  cfg = cfg or {}
  config.set(config.override(cfg))
end

---@param cfg? evergarden.types.config|table
function evergarden.load(cfg)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'evergarden'
  vim.o.termguicolors = true

  if cfg then
    cfg = config.override(cfg or {})
  else
    cfg = config.get()
  end

  if cfg.theme.variant == 'summer' then
    vim.go.background = 'light'
  else
    vim.go.background = 'dark'
  end

  local theme = require('evergarden.theme').setup(cfg)
  local hlgroups = require('evergarden.hl').setup(theme, cfg)

  local cache = cfg.cache or false
  if cache then
    local needs_compile = require('evergarden.cache').needs_compile(cfg)
    if not needs_compile then
      return require('evergarden.cache').load()
    end
    require('evergarden.cache').clear()
  end

  require('evergarden.utils').set_highlights(hlgroups, cache)

  if cache then
    require('evergarden.cache').write(cfg)
  end
end

function evergarden.colors()
  return require('evergarden.colors').get()
end

return evergarden
