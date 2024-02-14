# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## What's so Special About this Starter?
- [ESLint](https://www.lazyvim.org/extras/linting/eslint) formats on save and [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) has [diagnostics/linting](./lua/config/lazy.lua#L14)
- [Gruvbox](https://github.com/morhetz/gruvbox) theme
- Absolute line numbers ([relative line numbers disabled](./init.lua#L11))
- [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim)
- [git-blame.nvim](https://github.com/f-person/git-blame.nvim)
- [Snippets](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) [file started](./lua/plugins/snippets.lua) (ready for more custom snippets)
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [Markdown](https://www.youtube.com/watch?v=5ht8NYkU9wQ) setup [with conceal](https://github.com/epwalsh/obsidian.nvim)
- [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) `:TableModeToggle` to enter table mode (formats markdown tables)
- [Spectre](https://github.com/nvim-pack/nvim-spectre) for search/replace [on current word](./lua/plugins/spectre.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) [history](./lua/plugins/telescope.lua#L123-L125) and [window resizing](/lua/config/keymaps.lua#L12-L15) works with `Alt-<Arrow-Keys>` (for MacOS compatibility)
- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) with [`<C-\>`](./lua/plugins/toggleterm.lua)
- [tint.nvim](https://github.com/levouh/tint.nvim)
- [TabbyML](https://github.com/TabbyML/tabby) ([optional](./lua/plugins/tabby.lua))

## [Installation](https://www.lazyvim.org/installation)

- Make a backup of your current Neovim files:
```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the starter
```sh
git clone https://github.com/zvakanaka/LazyVim-starter ~/.config/nvim
```

- Remove the .git folder, so you can add it to your own repo later
```sh
rm -rf ~/.config/nvim/.git
```

- Start Neovim!
```sh
nvim
```

> [!TIP]
> It is recommended to run `:LazyHealth` after installation.
> This will load all plugins and check if everything is working correctly.

