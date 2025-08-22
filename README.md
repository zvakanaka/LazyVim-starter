# LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## What's so Special About this Starter?

- [ESLint](https://www.lazyvim.org/extras/linting/eslint) formats on save and [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) has [diagnostics/linting](./lua/config/lazy.lua#L14) with its [formatting disabled](./lua/plugins/lspconfig.lua)
- [Gruvbox](https://github.com/morhetz/gruvbox) theme - I think it's comfortable on the eyes (customize [here](./lua/plugins/colorscheme.lua))
- Absolute line numbers ([relative line numbers disabled](./init.lua#L11))
- Automatic updates disabled (`<leader>l` then `U` to update manually)
- Git plugins - [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim) (`<leader>gy` to yank link to file) and [git-blame.nvim](https://github.com/f-person/git-blame.nvim)
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) to highlight CSS [colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color)
- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) with [`<C-/>`](./lua/plugins/toggleterm.lua) to toggle bottom terminal, `<C-S-/>` for right side terminal (I use [Ghostty](https://zvakanaka.github.io/#../mere-blog/posts/code/ghostty.md) now, so I don't use this anymore)
- [Copilot](https://github.com/github/copilot.vim) with the accept keybind as `<C-CR>`
- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) interactive scrollbar with signs (git diff, diagnostics, etc.)
- [md-pdf.nvim](https://github.com/arminveres/md-pdf.nvim) and [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim) for markdown preview/export (`<leader>mp`) and image pasting (`<leader>v`)
- Toggle LSP with `<leader>ue` (`:LspStop`, `:LspStart`)

## Screenshots

![overview](./README-img/overview.png)

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
> It is recommended to run `:checkhealth` after installation.
> This will load all plugins and check if everything is working correctly.

I used to refer to [config notes](https://zvakanaka.github.io/#../mere-blog/posts/code/LazyVim.md) whenever setting up Neovim, but a starter started making more sense once I wanted a similar setup on multiple computers.

## [VSCode Neovim](https://github.com/asvetliakov/vscode-neovim) (optional)

Sometimes you may have a reason to use VS Code.

[This](https://github.com/asvetliakov/vscode-neovim) VS Code extension allows using Neovim inside VS Code, but keep in mind that Neovim UI still won't work in VS Code (Neovim plugin dialogs and such), so you may want to set up some keybindings to map VS Code's commands for its UI to LazyVim keybindings (my keybindings are below).

To get lazygit working, you can use the [lazygit VS Code extension](https://github.com/Chaitanya-Shahare/lazygit-for-vscode). In the keybindings below, there is one to map it to `<space>gg` (to be consistent with LazyVim's `<leader>gg`).

<details>
  <summary>VS Code Keybindings</summary>

```json
[
  {
    "key": "ctrl+s",
    "command": "vscode-neovim.lua",
    "args": ["vim.cmd.stopinsert()", "vim.cmd.write()"],
    "when":"editorTextFocus"
  },
  {
    "key": "space e",
    "command": "workbench.action.toggleSidebarVisibility",
    "when":"editorTextFocus && neovim.mode != insert"
  },
  {
    "key": "space g g",
    "command": "lazygit.openLazygit",
    "when": "editorTextFocus && neovim.mode != insert"
  },
  {
    "key": "space space",
    "command": "workbench.action.quickOpen",
    "when": "editorTextFocus && neovim.mode != insert"
  },
  {
    "key": "space /",
    "command": "workbench.action.findInFiles",
    "when": "editorTextFocus && neovim.mode != insert"
  },
  {
    "key": "space a",
    "command": "workbench.action.chat.openAgent",
    "when": "editorTextFocus && neovim.mode != insert && config.chat.agent.enabled && !chatSetupDisabled && !chatSetupHidden"
  },
  {
    "key": "ctrl+h",
    "command": "workbench.action.navigateLeft"
  },
  {
    "key": "ctrl+l",
    "command": "workbench.action.navigateRight"
  },
  {
    "key": "ctrl+k",
    "command": "workbench.action.navigateUp"
  },
  {
    "key": "ctrl+j",
    "command": "workbench.action.navigateDown"
  }
]
```

</details>

## Troubleshooting

If Copilot stops working and you recently set up another IDE, remove the `~/.config/github-copilot` folder and run `:Copilot setup` again (see [bug](https://github.com/orgs/community/discussions/152171#discussioncomment-12324088)).
