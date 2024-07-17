return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "night" },
  -- },

  -- add gruvbox https://github.com/ellisonleao/gruvbox.nvim
  {
    "ellisonleao/gruvbox.nvim",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "gruvbox" },
    },
  },
}
