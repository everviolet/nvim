![preview__lua](./images/asset.lua.png)

<h1 align="center">
    evergarden
</h1>

evergarden is a comfy neovim colorscheme for cozy morning coding.

evergarden is inspired by the [everforest colorscheme](https://github.com/sainnhe/everforest) and [nord colorscheme](https://github.com/nordtheme/nord).

evergarden was designed as a cozy theme with a focus on readability and visual comfort.

|        |                                                     |
| :----: | :-------------------------------------------------: |
|  hard  | ![preview-hard__rust](./images/asset.hard.rust.png) |
| medium |      ![preview-rust](./images/asset.rust.png)       |
|  soft  | ![preview-soft__rust](./images/asset.soft.rust.png) |

## Installation

using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  'comfysage/evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    transparent_background = true,
    variant = 'medium', -- 'hard'|'medium'|'soft'
    overrides = { }, -- add custom overrides
  }
}
```

using [vim-plug](https://github.com/junegunn/vim-plug):

```Vim
Plug 'comfysage/evergarden'
```

## Configuration

```lua
require 'evergarden'.setup {
  transparent_background = false,
  variant = 'medium', -- 'hard'|'medium'|'soft'
  override_terminal = true,
  style = {
    tabline = { reverse = true, color = 'green' },
    search = { reverse = false, inc_reverse = true },
    types = { italic = true },
    keyword = { italic = true },
    comment = { italic = false },
    sign = { highlight = false },
  },
  overrides = { }, -- add custom overrides
}
```

### Overrides

Overrides can take all options passed to `vim.api.nvim_set_hl()`.

> [!note]
>
> - Ensure that `fg` (foreground color) and `bg` (background color) are correctly positioned as the first and second elements in the table, respectively. The `fg` and `bg` fields can also be refered to directly.
> - Confirm that `fg` and `bg` are strings or arrays, with the first element representing the GUI color, and the second element representing the CTERM (Color Terminal) color, if specified.

```lua
require 'evergarden'.setup {
  overrides = {
    Normal = {
      '#fddce3',
      '#1d2021',

      -- Additional highlight options can be included here
      style = { 'bold', 'italic' }
    },
    Keyword = {
      fg = '#ce96de',
      bg = '#ae45be',
    },
  },
}
```

## Features

- Lots of style-customization options (contrast, color invertion etc.)
- Support for Treesitter highlighting.
- Support for transparent background.
- Supported plugins: [GitGutter][], [Telescope][].

  [gitgutter]: https://github.com/airblade/vim-gitgutter
  [telescope]: https://github.com/nvim-telescope/telescope

![telescope preview](./images/asset.telescope.png)

## :sparkles: Extras

- [kitty theme](./extras/kitty)
- [base16-scheme](./extras/base16)
- [scss](./extras/scss/evergarden.scss)
- [discord theme](https://github.com/comfysage/evg-discord)
- [userstyles](https://github.com/comfysage/userstyles)

## License

[MIT/X11](https://en.wikipedia.org/wiki/MIT_License)
