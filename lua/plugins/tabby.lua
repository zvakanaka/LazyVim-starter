-- TABBY_DISABLE_USAGE_COLLECTION=1 tabby serve --device metal --model TabbyML/StarCoder-1B
return {
  {
    "TabbyML/vim-tabby",
    init = function()
      vim.g.tabby_keybinding_accept = "<C-CR>"
    end,
  },
}
