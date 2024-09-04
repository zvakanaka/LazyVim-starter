return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      wrap_results = true,
      layout_config = {
        horizontal = {
          width = 0.95,
          preview_width = 0.65,
        },
      },
    },
  },
  keys = {
    {
      "<leader>/",
      -- additional args are in rg format https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
      LazyVim.pick("live_grep", {
        additional_args = {
          "--glob=!*.json",
          "--glob=!*mock*",
          "--glob=!*test*",
          "--glob=!*stories*",
          "--glob=!*.mdx",
          "--glob=!*.spec*",
        },
      }),
      desc = "Grep main files (Root Dir)",
    },
    {
      "<leader>?",
      -- additional args are in rg format https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
      LazyVim.pick("live_grep", {
        additional_args = {
          "--glob=*.json",
          "--glob=*mock*",
          "--glob=*test*",
          "--glob=*stories*",
          "--glob=*.mdx",
          "--glob=*.spec*",
        },
      }),
      desc = "Grep tests/mock/stories/json (root dir)",
    },
  },
}
