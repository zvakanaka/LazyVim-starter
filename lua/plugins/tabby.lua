-- stylua: ignore
if true then return {} end

-- run this command from another terminal to start tabby: TABBY_DISABLE_USAGE_COLLECTION=1 tabby serve --device metal --model TabbyML/StarCoder-1B
-- there's no harm in leaving this here and not having tabby set up
return {
  {
    "TabbyML/vim-tabby",
    init = function()
      vim.g.tabby_keybinding_accept = "<C-CR>"
    end,
  },
}
