---@module 'evergarden.colors'

local M = {}

local variants = vim.defaulttable(function(k)
  local ok, variant = pcall(require, ('evergarden.palettes.%s'):format(k))
  if not ok then
    return {}
  end
  return variant
end)

---@param cfg? evergarden.types.config
---@return evergarden.types.colors
function M.get(cfg)
  cfg = cfg or require('evergarden.config').get()
  local palette
  if cfg.theme.ansi then
    if cfg.theme.variant == 'summer' then
      palette = require('evergarden.ansi').summer
    else
      palette = require('evergarden.ansi').palette
    end
  else
    palette = variants[cfg.theme.variant]
  end
  return vim.tbl_deep_extend('force', palette, cfg.color_overrides)
end

return M
