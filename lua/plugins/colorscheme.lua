-- NOTE: Cursor color is something you set in your terminal emulator.
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

  -- Configure LazyVim to load gruvbox light
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "gruvbox" },
      -- comment out the line below to use the non-light gruvbox
      style = "light",
    },
  },
}
