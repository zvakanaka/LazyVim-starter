-- stylua: ignore
-- if true then return {} end

return {
  "github/copilot.vim",
  init = function()
    local wk = require("which-key")
    wk.add({
      {
        "<C-CR>",
        'copilot#Accept("\\<CR>")',
        desc = "Accept Copilot suggestion",
        expr = true,
        mode = "i",
        replace_keycodes = false,
      },
    })
    -- also accept with alt+a
    wk.add({
      {
        "<A-a>",
        'copilot#Accept("\\<CR>")',
        desc = "Accept Copilot suggestion",
        expr = true,
        mode = "i",
        replace_keycodes = false,
      },
    })

    wk.add({
      { "<C-L>", "<Plug>(copilot-accept-word)", desc = "Accept Copilot word", mode = "i" },
    })

    wk.add({
      { "<C-/>", "<Plug>(copilot-accept-line)", desc = "Accept Copilot line", mode = "i" },
    })

    vim.g.copilot_no_tab_map = true
  end,
}
