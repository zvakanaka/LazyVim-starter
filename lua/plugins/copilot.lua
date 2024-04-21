-- stylua: ignore
-- if true then return {} end

return {
  "github/copilot.vim",
  init = function()
    local wk = require("which-key")

    wk.register({
      ["<C-CR>"] = { 'copilot#Accept("\\<CR>")', "Accept Copilot suggestion" },
    }, { mode = "i", expr = true, replace_keycodes = false })

    wk.register({
      ["<C-L>"] = { '<Plug>(copilot-accept-word)', "Accept Copilot word" }
    }, { mode = "i"})

    vim.g.copilot_no_tab_map = true
  end,
}
