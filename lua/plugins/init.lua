return {
  {
    "dhruvasagar/vim-table-mode",
    keys = {
      { "<leader>sx", "<cmd>TableModeToggle<cr>", desc = "Table Mode Toggle" },
    },
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
