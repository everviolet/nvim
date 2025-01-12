local evergarden = {}

---@param config? evergarden.types.config|table
function evergarden.setup(config)
  require('evergarden.config').set(config or {})
end

---@param config? evergarden.types.config|table
function evergarden.load(config)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'evergarden'
  vim.o.termguicolors = true

  local cfg
  if config then
    cfg = require('evergarden.config').override(config or {})
  else
    cfg = require('evergarden.config').get()
  end

  local colors = require('evergarden.colors').get(cfg)
  local theme = require('evergarden.theme').setup(colors, cfg)
  local hlgroups = require('evergarden.hl.init').setup(theme, cfg)

  require('evergarden.utils').set_highlights(hlgroups)
end

function evergarden.colors()
  return require('evergarden.colors').colors()
end

return evergarden
