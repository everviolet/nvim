local M = {}

---@param theme evergarden.types.theme
---@param config evergarden.types.config
---@return evergarden.types.hlgroups.OL
function M.setup(theme, config)
  ---@type evergarden.types.hlgroups.OL
  local hl_groups = {}

  local load_hl =
    require('evergarden.utils').make_hl_loader(hl_groups, theme, config)

  load_hl(
    'evergarden.hl.%s',
    { 'editor', 'syntax', 'treesitter', 'diagnostics' }
  )
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

  load_hl('evergarden.hl.ft.%s', {
    'lua',
    'bash',
    'css',
    'help',
    'markdown',
    'nix',
    'rust',
    'typescript',
  })

  if config.editor.override_terminal then
    require 'evergarden.hl.terminal'(theme)
  end

  local overrides = config.overrides or {}
  if type(overrides) == 'function' then
    overrides = overrides(theme) --[[@as evergarden.types.hlgroups.OL]]
  end
  table.insert(hl_groups, overrides)

  return hl_groups
end

return M
