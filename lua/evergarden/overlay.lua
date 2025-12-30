---@module 'evergarden.overlay'

---@class evergarden.types.overlay
---@field __index evergarden.types.overlay
---@field value evergarden.types.hlgroups.OL
---@field config evergarden.types.config
local overlay = {}
overlay.__index = overlay

---@param hlgroups evergarden.types.hlgroups.OL
---@param config evergarden.types.config
function overlay:new(hlgroups, config)
  return setmetatable({ value = hlgroups, config = config }, overlay)
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
      return vim.tbl_extend('force', acc, self:new(groups, self.config):fold())
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
    :each(function(group, hl)
      require('evergarden.utils').set_hl(group, hl, self.config)
    end)

  vim.iter(ipairs(hlgroups)):each(function(_, groups)
    if not type(groups) == 'table' then
      return
    end
    self:new(groups, self.config):set()
  end)
end

return overlay
