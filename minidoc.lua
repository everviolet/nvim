local minidoc = require 'mini.doc'

if _G.MiniDoc == nil then
  minidoc.setup()
end

local current = {}

local hooks = vim.deepcopy(MiniDoc.default_hooks)

hooks.write_pre = function(lines)
  -- Remove first two lines with `======` and `------` delimiters to comply
  -- with `:h local-additions` template
  table.remove(lines, 1)
  table.remove(lines, 1)
  return lines
end

local function module_register(s)
  if #s == 0 then
    return
  end

  -- Remove first word (with bits of surrounding whitespace) while capturing it
  local modname
  s[1] = s[1]:gsub('%s*\'(%S+)\' ?', function(x)
    modname = x
    return ''
  end, 1)
  if modname == nil then return end

  local f = vim.tbl_get(s, 'parent', 'parent')
  if not f then return end

  current.modules = current.modules or {}
  current.modules[f.info.path] = modname
end

local function modpattern(name)
  return "%f[%w_]" .. name .. "%f[^%w_]"
end

local function module_replace(s)
  if current.modules == nil then return end

  local f = vim.tbl_get(s, 'parent', 'parent')
  if not f then return end

  local modname = current.modules[f.info.path]
  if modname == nil then return end

  s[1] = string.gsub(s[1], modpattern('M'), modname)
end

hooks.sections['@module'] = function(s)
  module_register(s)
end

hooks.section_pre = function(s)
  MiniDoc.default_hooks.section_pre(s)

  module_replace(s)
end

hooks.file = function(f)
  MiniDoc.default_hooks.file(f)

  current.modules[f.info.path] = {}
end

-- init

local init_base = 'lua/evergarden'

local init_mods = vim
  .iter(vim.fs.dir(init_base))
  :map(function(modfile, ftype)
    if ftype == 'file' then
      return {
        name = string.gsub(vim.fs.basename(modfile), '%.lua$', ''),
        path = vim.fs.joinpath(init_base, modfile),
      }
    end
  end)
  :each(function(mod)
    local name = 'evergarden'
    if name ~= 'init' then
      name = name .. '-' .. mod.name
    end
    minidoc.generate({ mod.path }, 'doc/' .. name .. '.txt', { hooks = hooks })
  end)
