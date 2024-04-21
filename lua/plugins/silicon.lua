-- Snapshot visually selected code with <leader>sc
-- `brew install silicon`
return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  init = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>sc"] = {
        ":Silicon<CR>",
        "Snapshot/Screenshot Code and Copy to Clipboard (silicon)",
      },
    }, { mode = "v" })
  end,
  config = function()
    require("silicon").setup({
      background = "#0000",
      font = "JetBrainsMonoNL Nerd Font Mono=34",
      tab_width = 2,
      to_clipboard = true,
    })
  end,
}
