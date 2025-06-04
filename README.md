<h3 align="center">
	<img src="https://github.com/everviolet/.github/raw/main/assets/logo-circle.png" width="100" alt="Logo"/><br/>
	Evergarden for <a href="https://github.com/neovim/neovim">Neovim</a>
</h3>

<p align="center">
	<a href="https://github.com/everviolet/nvim/stargazers"><img src="https://img.shields.io/github/stars/everviolet/nvim?style=for-the-badge&colorA=313B40&colorB=DBBC7F"></a>
	<a href="https://github.com/everviolet/nvim/issues"><img src="https://img.shields.io/github/issues/everviolet/nvim?style=for-the-badge&colorA=313B40&colorB=E69875"></a>
	<a href="https://github.com/everviolet/nvim/contributors"><img src="https://img.shields.io/github/contributors/everviolet/nvim?style=for-the-badge&colorA=313B40&colorB=97C9C3"></a>
</p>

<p align="center">
	<img src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/preview.webp"/>
</p>

evergarden is a comfy neovim colorscheme for cozy morning coding.

evergarden's palette is inspired by the [everforest
colorscheme](https://github.com/sainnhe/everforest) and [nord
colorscheme](https://github.com/nordtheme/nord) and it's design is largely
influenced by [catppuccin](https://github.com/catppuccin/catppuccin).

evergarden was designed as a cozy theme with a focus on readability and visual
comfort.

### Previews

<details>
<summary>Winter</summary>
<img alt="winter variant preview" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/winter.webp"/>
</details>
<details>
<summary>Fall</summary>
<img alt="fall variant preview" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/fall.webp"/>
</details>
<details>
<summary>Spring</summary>
<img alt="spring variant preview" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/spring.webp"/>
</details>
<details>
<summary>Summer</summary>
<img alt="summer variant preview" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/summer.webp"/>
</details>

<details>
<summary>more screenshots</summary>
<img alt="preview__rust" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/rust.webp"/>
<img alt="preview__lua" src="https://raw.githubusercontent.com/everviolet/nvim/mega/assets/previews/lua.webp"/>
</details>

###### font in screenshots is [maple mono](https://github.com/subframe7536/maple-font)

## Installation

using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  'everviolet/nvim', name = 'evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    theme = {
      variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
      accent = 'green',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        invert_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  }
}
```

using [vim-plug](https://github.com/junegunn/vim-plug):

```Vim
Plug 'everviolet/nvim', { 'as': 'evergarden' }
```

## Configuration

```lua
require 'evergarden'.setup {
  theme = {
    variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
    accent = 'green',
  },
  editor = {
    transparent_background = false,
    override_terminal = true,
    sign = { color = 'none' },
    float = {
      color = 'mantle',
      invert_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
  style = {
    tabline = { 'reverse' },
    search = { 'italic', 'reverse' },
    incsearch = { 'italic', 'reverse' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
  },
  overrides = {},
  color_overrides = {},
}
```

### Integrations

```lua
{
  integrations = {
    blink_cmp = true,
    cmp = true,
    fzf_lua = true,
    gitsigns = true,
    indent_blankline = { enable = true, scope_color = 'green' },
    mini = {
      enable = true,
      animate = true,
      clue = true,
      completion = true,
      cursorword = true,
      deps = true,
      diff = true,
      files = true,
      hipatterns = true,
      icons = true,
      indentscope = true,
      jump = true,
      jump2d = true,
      map = true,
      notify = true,
      operators = true,
      pick = true,
      starters = true,
      statusline = true,
      surround = true,
      tabline = true,
      test = true,
      trailspace = true,
    },
    nvimtree = true,
    rainbow_delimiters = true,
    symbols_outline = true,
    telescope = true,
    which_key = true,
    neotree = true,
  },
}
```

### Overrides

Overrides can take a few options:

- `fg`: foreground color (e.g., `"#fddce3"`)
- `bg`: background color (e.g., `"#1d2021"`)
- `style`: styles for highlight (e.g., `{ 'bold', 'italic' }`)

Foreground and background colors can also be written with a shorthand: `{ '#<fg>', '#<bg>' }`.

> [!note]
>
> - Ensure that `fg` (foreground color) and `bg` (background color) are
>   correctly positioned as the first and second elements in the table,
>   respectively. The `fg` and `bg` fields can also be refered to directly.
> - Confirm that `fg` and `bg` are strings, starting with a hash (`#`).

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

- Lots of style-customization options (background variants, color invertion, italics etc.)
- Support for Treesitter highlighting.
- Support for transparent background.
- Supported plugins: [blink_cmp][] [cmp][] [fzf_lua][] [gitsigns][] [indent_blankline][] [mini][] [neotree][] [nvimtree][] [rainbow_delimiters][] [symbols_outline][] [telescope][] [which_key][].

[blink_cmp]: https://github.com/Saghen/blink.cmp
[cmp]: https://github.com/hrsh7th/nvim-cmp
[fzf_lua]: https://github.com/ibhagwan/fzf-lua
[gitsigns]: https://github.com/lewis6991/gitsigns.nvim
[indent_blankline]: https://github.com/lukas-reineke/indent-blankline.nvim
[mini]: https://github.com/echasnovski/mini.nvim
[neotree]: https://github.com/nvim-neo-tree/neo-tree.nvim
[nvimtree]: https://github.com/nvim-tree/nvim-tree.lua
[rainbow_delimiters]: https://github.com/hiphish/rainbow-delimiters.nvim
[symbols_outline]: https://github.com/simrat39/symbols-outline.nvim
[telescope]: https://github.com/nvim-telescope/telescope.nvim
[which_key]: https://github.com/folke/which-key.nvim

## :sparkles: Extras

- [alacritty](https://github.com/everviolet/alacritty)
- [iterm](https://github.com/everviolet/iterm)
- [kitty](https://github.com/everviolet/kitty)
- [ghostty](https://github.com/everviolet/ghostty)
- [tmux](https://github.com/everviolet/tmux)
- [discord](https://github.com/everviolet/discord)
- [home-manager](https://github.com/everviolet/nix)

## License

[GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)
