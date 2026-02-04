-- stylua: ignore start
-- if true then return {} end
-- stylua: ignore end
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
    image = {},
    lazygit = {
      win = {
        width = 0.95,
      },
    },
  },
  keys = {
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep (excluding test/stories files)",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
  },
}
