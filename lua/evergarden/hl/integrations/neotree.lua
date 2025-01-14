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
    NeoTreeModified = { fg = theme.diagnostic.warn },

    NeoTreeGitAdded = { fg = theme.diff.add },
    NeoTreeGitConflict = { fg = theme.diagnostic.error },
    NeoTreeGitDeleted = { fg = theme.diff.delete },
    NeoTreeGitModified = { fg = theme.diff.change },
    NeoTreeGitStaged = { fg = theme.git.staged },
    NeoTreeGitUntracked = { fg = theme.git.untracked },
    NeoTreeGitIgnored = { fg = theme.git.ignored },
    NeoTreeGitUnstaged = { fg = theme.git.unstaged },

    NeoTreeFloatBorder = { link = 'FloatBorder' },
    NeoTreeFloatTitle = { link = 'FloatTitle' },

    NeoTreeTitleBar = {
      fg = theme.crust,
      bg = theme.accent,
    },

    NeoTreeFileNameOpened = { fg = colors.folder },
    NeoTreeDimText = { fg = colors.folder },
    NeoTreeFilterTerm = { fg = theme.green, style = { 'bold' } },
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
