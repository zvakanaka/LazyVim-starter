return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = {
    open_cmd = "noswapfile vnew",
  },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open_visual({select_word=true, path="!.eslintcache !dist !*mock* !*json !*mdx !*stories* !*test*"}) end, desc = "Replace in files (Spectre)" },
    { "<leader>sp", function() require("spectre").open_file_search({select_word=true}) end, desc = "Replace in current file (Spectre)" },
  },
}
