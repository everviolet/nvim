---@diagnostic disable: redefined-local

local M = {}

M.reload = function()
  local ok, plenary = pcall(require, 'plenary.reload')

  if not ok then
    return
  end

  plenary.reload_module 'evergarden'
  plenary.reload_module('lualine.themes.evergarden', true)
end

M.run = function(testname)
  M.reload()

  testname = testname or 'setup'
  local ok, result =
    pcall(require, string.format('evergarden.test.%s', testname))
  if not ok then
    error(
      string.format('error while running test (%s):\n\t%s', testname, result)
    )
  end

  M.fixup()
end

M.fixup = function()
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
end

return M
