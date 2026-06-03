return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "stevearc/aerial.nvim", enabled = false },
  { "ahmedkhalf/project.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
}
