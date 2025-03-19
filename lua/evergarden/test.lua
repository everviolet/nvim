---@diagnostic disable: redefined-local

local ok, plenary = pcall(require, 'plenary.reload')

if not ok then
  return
end

plenary.reload_module 'evergarden'
plenary.reload_module('lualine.themes.evergarden', true)

require('evergarden').setup {
  editor = {
    transparent_background = true,
  },
}

require('evergarden').load()

-- fixup
local ok, lualine = pcall(require, 'lualine')
if ok then
  lualine.setup {}
end
local ok, ibl = pcall(require, 'ibl')
if ok then
  ibl.initialized = false
  ibl.setup(require('ibl.config').config)
end

vim.api.nvim_exec_autocmds('ColorScheme', {})
