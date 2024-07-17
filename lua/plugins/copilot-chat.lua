return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      -- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    init = function()
      local wk = require("which-key")
      wk.add({ "<leader>C", ":CopilotChat<CR>", desc = "Open Copilot Chat Window", mode = { "n", "v" } })
    end,
  },
}
