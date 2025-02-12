local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups.OL
function M.setup(theme, config)
  ---@type evergarden.types.hlgroups.OL
  local hl_groups = {}

  local load_hl = require('evergarden.utils').make_hl_loader(
    hl_groups,
    { theme = theme, config = config }
  )

  local accents = {
    RedAccent = { theme.red, '#453539' },
    OrangeAccent = { theme.orange, '#4A453E' },
    YellowAccent = { theme.yellow, '#4A4941' },
    GreenAccent = { theme.green, '#384239' },
    AquaAccent = { theme.aqua, '#344240' },
    SkyeAccent = { theme.skye, '#313F42' },
    BlueAccent = { theme.blue, '#363A47' },
    PurpleAccent = { theme.purple, '#43374A' },
    PinkAccent = { theme.pink, '#453547' },
  }

  table.insert(hl_groups, accents)

  load_hl(
    'evergarden.hl.%s',
    { 'editor', 'syntax', 'treesitter', 'diagnostics' }
  )
  load_hl('evergarden.hl.ft.%s', {
    'lua',
    'html',
    'css',
    'help',
    'markdown',
    'rust',
    'typescript',
  })

  load_hl(
    'evergarden.hl.integrations.%s',
    vim
      .iter(pairs(config.integrations))
      :map(function(name, props)
        if
          not (
            (type(props) == 'table' and props.enable)
            or (type(props) == 'boolean' and props)
          )
        then
          return
        end
        return name
      end)
      :totable()
  )

  if config.override_terminal then
    require 'evergarden.hl.terminal'(theme, theme.colors)
  end

  local overrides = config.overrides or {}
  if type(overrides) == 'function' then
    overrides = overrides(theme.colors) --[[@as evergarden.types.hlgroups.OL]]
  end
  table.insert(hl_groups, overrides)

  return hl_groups
end

return M
