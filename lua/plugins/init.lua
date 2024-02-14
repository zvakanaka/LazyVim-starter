return {
  "f-person/git-blame.nvim",
  "dhruvasagar/vim-table-mode", -- :TableModeToggle to enter table mode
  {
    "ruifm/gitlinker.nvim",
    -- fork with updated features/bugs:
    -- 'linrongbin16/gitlinker.nvim',
    config = function()
      require("gitlinker").setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      {
        [[<C-\>]],
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        desc = "Open a horizontal terminal at the Desktop directory",
      },
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
}
