local path = "!.eslintcache !dist !*mock* !*json !*mdx !*stories* !*test*"

return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = {
    open_cmd = "noswapfile vnew",
  },
  -- stylua: ignore
  keys = {
    {
      "<leader>pR",
      function()
        require("spectre").open_visual({ select_word = true, path = path })
      end,
      desc = "Replace current word in files (Spectre)",
    },
    {
      "<leader>pr",
      function()
        require("spectre").open_visual({ path = path })
      end,
      desc = "Replace in files (Spectre)",
    },
    {
      "<leader>pP",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Replace current word in current file (Spectre)",
    },
    {
      "<leader>pp",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Replace in current file (Spectre)",
    },
  },
}
