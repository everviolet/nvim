---@diagnostic disable: missing-fields

local ok, result = pcall(require, 'luassert')
if not ok then
  return
end

assert = result

---@private
local function get_hl(name)
  return vim.api.nvim_get_hl(
    0,
    { name = name or 'Normal', link = false, create = false }
  )
end

---@param hex_str string hexadecimal value of a color
local hex_to_int = function(hex_str)
  local hex = '[abcdef0-9]'
  local pat = '^#(' .. string.rep(hex, 6) .. ')$'
  hex_str = string.lower(hex_str)

  assert(
    string.find(hex_str, pat) ~= nil,
    'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str)
  )

  local hex_v = string.match(hex_str, pat)
  return tonumber(hex_v, 16)
end

---@private
---@param name? string
---@param attr 'fg'|'bg'|string
---@param value string
local function assert_hl(name, attr, value)
  local color = string.format('#%X', get_hl(name)[attr])
  return assert.are_equal(value, color)
end

-- tests

require('evergarden').load {}
assert_hl(nil, 'fg', '#DDDECF')
assert_hl(nil, 'bg', '#232A2E')
require('evergarden').load { theme = { variant = 'winter' } }
assert_hl(nil, 'bg', '#1D2428')
require('evergarden').load { theme = { variant = 'spring' } }
assert_hl(nil, 'bg', '#2B3538')

vim.notify '== OK == tests passed succesfully'
