local config = require 'evergarden.config'

local evergarden = {}

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

  local theme = require('evergarden.theme').setup(cfg)
  local hlgroups = require('evergarden.hl').setup(theme, cfg)

  require('evergarden.utils').set_highlights(hlgroups)
end

function evergarden.colors()
  return require('evergarden.colors').get()
end

return evergarden
