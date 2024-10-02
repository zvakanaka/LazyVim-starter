return {
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
}
