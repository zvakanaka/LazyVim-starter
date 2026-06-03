-- NOTE: Cursor color is something you set in your terminal emulator.
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        -- transparent_mode = true, -- causes problems with bufferline.nvim (this is fixable, so maybe later)
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
