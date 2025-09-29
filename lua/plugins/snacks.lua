-- stylua: ignore
-- if true then return {} end
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    picker = {
      sources = {
        grep = {
          exclude = {
            "**/*.test.js",
            "**/*.stories.js",
            "translation.json",
            "**/*mock*",
          },
        },
      },
    },
    image = {
      -- your image configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  keys = {
    {
      "<leader>/",
      function() Snacks.picker.grep() end,
      desc = "Grep (excluding test/stories files)",
    },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
