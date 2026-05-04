return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
