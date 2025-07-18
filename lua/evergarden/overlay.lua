---@module 'evergarden.overlay'

---@class evergarden.types.overlay
---@field __index evergarden.types.overlay
---@field value evergarden.types.hlgroups.OL
local overlay = {}
overlay.__index = overlay

function overlay:new(hlgroups)
  return setmetatable({ value = hlgroups }, overlay)
end

function overlay:get()
  return self.value
end

---@return evergarden.types.hlgroups
function overlay:fold()
  local hlgroups = self:get()
  if #hlgroups == 0 then
    return hlgroups
  end

  local basegroups = vim.iter(pairs(hlgroups)):fold({}, function(acc, name, hl)
    if type(name) == 'string' then
      acc[name] = hl
    end
    return acc
  end)

  local folded = vim
    .iter(ipairs(hlgroups))
    :fold(basegroups, function(acc, _, groups)
      if not type(groups) == 'table' then
        return acc
      end
      return vim.tbl_extend('force', acc, self:new(groups):fold())
    end)
  return folded
end

function overlay:set()
  local hlgroups = self:get()

  vim
    .iter(pairs(hlgroups))
    :filter(function(group, hl)
      return type(group) == 'string' and type(hl) == 'table'
    end)
    :each(require('evergarden.utils').set_hl)

  vim.iter(ipairs(hlgroups)):each(function(_, groups)
    if not type(groups) == 'table' then
      return
    end
    self:new(groups):set()
  end)
end

return overlay
