local M = {}

--@param theme evergarden.types.theme
--@param config evergarden.types.config
M.get = function(theme, config)
  local colors = {
    folder = theme.overlay2,
  }

  return {
    NeoTreeDirectoryName = { fg = colors.folder },
    NeoTreeDirectoryIcon = { fg = colors.folder },
    NeoTreeNormal = {
      fg = theme.subtext1,
      bg = config.transparent_background and theme.none or theme.mantle,
    },
    NeoTreeNormalNC = {
      fg = theme.subtext1,
      bg = config.transparent_background and theme.none or theme.mantle,
    },
    NeoTreeExpander = { fg = colors.folder },
    NeoTreeIndentMarker = { fg = theme.overlay0 },
    NeoTreeRootName = { fg = theme.pink },
    NeoTreeSymbolicLinkTarget = { fg = theme.pink },
    NeoTreeModified = { fg = theme.yellow },

    NeoTreeGitAdded = { fg = theme.diff.add },
    NeoTreeGitConflict = { fg = theme.red },
    NeoTreeGitDeleted = { fg = theme.diff.delete },
    NeoTreeGitIgnored = { fg = theme.overlay0 },
    NeoTreeGitModified = { fg = theme.yellow },
    NeoTreeGitUnstaged = { fg = theme.red },
    NeoTreeGitUntracked = { fg = theme.purple },
    NeoTreeGitStaged = { fg = theme.green },

    NeoTreeFloatBorder = { link = 'FloatBorder' },
    NeoTreeFloatTitle = { link = 'FloatTitle' },
    NeoTreeTitleBar = {
      fg = theme.subtext1,
      bg = config.transparent_background and theme.none or theme.mantle,
    },

    NeoTreeFileNameOpened = { fg = colors.folder },
    NeoTreeDimText = { fg = colors.folder },
    NeoTreeFilterTerm = { style = { 'bold' } },
    NeoTreeTabActive = {
      fg = theme.orange,
      bg = config.transparent_background and theme.none or theme.mantle,
    },
    NeoTreeTabInactive = {
      fg = theme.surface2,
      bg = config.transparent_background and theme.none or theme.crust,
    },
    NeoTreeTabSeparatorActive = {
      fg = config.transparent_background and theme.none or theme.mantle,
      bg = config.transparent_background and theme.none or theme.mantle,
    },
    NeoTreeTabSeparatorInactive = {
      fg = config.transparent_background and theme.none or theme.crust,
      bg = config.transparent_background and theme.none or theme.crust,
    },
    NeoTreeVertSplit = { fg = theme.overlay0 },
    NeoTreeWinSeparator = {
      fg = config.transparent_background and theme.surface1 or theme.base,
      bg = config.transparent_background and theme.none or theme.base,
    },
    NeoTreeStatusLineNC = { fg = theme.mantle, bg = theme.mantle },
  }
end

return M
