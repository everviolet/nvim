local M = {}

---@param min number
---@param max number
---@param v number
---@return number
local function clamp(min, max, v)
  return math.max(min, math.min(max, v))
end

---@param group string
---@param colors evergarden.types.colorspec
local function set_hl(group, colors)
  if type(colors) ~= 'table' or vim.tbl_isempty(colors) then
    return
  end
  if type(group) ~= 'string' then
    return error(
      string.format(
        'type of group was expected to be string but got `%s`',
        vim.inspect(group)
      )
    )
  end

  colors.fg = colors.fg or colors[1] or 'none'
  colors.bg = colors.bg or colors[2] or 'none'

  ---@type vim.api.keyset.highlight
  local color = {
    fg = colors.fg,
    bg = colors.bg,
    link = colors.link,
    blend = colors.blend,
  }

  local styles = vim
    .iter(ipairs(colors.style or {}))
    :fold({}, function(acc, _, style)
      acc[style] = true
      return acc
    end)

  color = vim.tbl_extend('force', color, styles)

  vim.api.nvim_set_hl(0, group, color)
end

---@param hlgroups evergarden.types.hlgroups.OL
---@return evergarden.types.hlgroups
function M.fold_groups(hlgroups)
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
      return vim.tbl_extend('force', acc, M.fold_groups(groups))
    end)
  return folded
end

---@param hlgroups evergarden.types.hlgroups.OL
function M.set_highlights(hlgroups)
  local groups = M.fold_groups(hlgroups)
  ---@type evergarden.types.colorspec
  local color = groups.Normal
  if not color then
    return
  end
  set_hl('Normal', color)
  groups.Normal = nil

  for group, colors in pairs(groups) do
    set_hl(group, colors)
  end
end

---@generic T
---@param props { [evergarden.types.variant]: T }
---@return T?
function M.vary_color(props)
  if not props then
    return
  end
  local cfg = require('evergarden.config').get()
  if props[cfg.variant] then
    return props[cfg.variant]
  elseif props.medium then
    return props.medium
  else
    return nil
  end
end

---@generic T
---@param fg T
---@param bg T
---@param style evergarden.types.styleopt
---@return evergarden.types.colorspec
function M.vary_reverse(fg, bg, style)
  if vim.tbl_contains(style, 'reverse') then
    return { fg, bg, style = style }
  else
    return { fg, style = style }
  end
end

---@param hex_str string hexadecimal value of a color
local hex_to_rgb = function(hex_str)
  local hex = '[abcdef0-9][abcdef0-9]'
  local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
  hex_str = string.lower(hex_str)

  assert(
    string.find(hex_str, pat) ~= nil,
    'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str)
  )

  local red, green, blue = string.match(hex_str, pat)
  return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

--- adapted from @catppuccin/nvim https://github.com/catppuccin/nvim/blob/5b5e3aef9ad7af84f463d17b5479f06b87d5c429/lua/catppuccin/utils/colors.lua#L24
---@param fg string
---@param bg string
---@param alpha number amount of fg to mix in (0.0 is only bg)
---@return string
function M.blend(fg, bg, alpha)
  ---@diagnostic disable-next-line: cast-local-type
  bg = hex_to_rgb(bg)
  ---@diagnostic disable-next-line: cast-local-type
  fg = hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = math.floor((alpha * fg[i] + ((1 - alpha) * bg[i])) + 0.5)
    return clamp(0, 255, ret)
  end

  return string.format(
    '#%02X%02X%02X',
    blendChannel(1),
    blendChannel(2),
    blendChannel(3)
  )
end

---@param hls evergarden.types.hlgroups.OL
---@param props { theme: evergarden.types.theme, config: evergarden.types.config }
---@return fun(modbase: string, lst: string[])
function M.make_hl_loader(hls, props)
  local theme, config = props.theme, props.config
  vim.validate('theme', theme, 'table')
  vim.validate('theme', config, 'table')
  return function(modbase, lst)
    local overlays = vim
      .iter(ipairs(lst))
      :map(function(_, mod)
        local mod_path = modbase:format(mod)
        local ok, result = pcall(require, mod_path)
        if not ok then
          return error(
            string.format('could not import hl groups from %s', mod_path)
          )
        end

        ---@type fun(theme, config): evergarden.types.hlgroups.OL
        local cb
        if type(result) == 'table' then
          if result.get and type(result.get) == 'function' then
            cb = result.get
          else
            return result
          end
        elseif type(result) == 'function' then
          cb = result
        end

        ---@diagnostic disable-next-line: redefined-local
        local ok, result = pcall(cb, theme, config)
        if not ok then
          return
        end
        return result
      end)
      :totable()
    table.insert(hls, overlays)
  end
end

return M
