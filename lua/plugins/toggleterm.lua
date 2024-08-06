return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        persist_mode = false,
        start_in_insert = true,
      })
    end,
    keys = {
      {
        [[<C-/>]],
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        desc = "Open a horizontal terminal at the current directory",
      },
      {
        [[<C-\>]],
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Open a floating terminal at the current directory",
      },
      {
        [[<C-S-/>]],
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        desc = "Open a vertical terminal at the current directory",
      },
      {
        "<leader>te",
        "<cmd>TermExec cmd='npm test %:r.test.js' direction=vertical size=80 name='Run npm test Associated with This File'<cr>",
        desc = "Run npm test associated with the current file",
      },
      {
        "<leader>tT",
        "<cmd>TermExec cmd='npm test %:h' direction=vertical size=80 name='Run npm test Associated with This File'<cr>",
        desc = "Run npm test associated with the directory containing the current file",
      },
      {
        "<leader>tb",
        "<cmd>TermExec cmd='bump && git add . && git commit --no-verify -m \"bump version and update changelog\"; sleep 4; exit' direction=vertical size=80 name='bump-package-json-version-script'<cr>",
        desc = "Update the package json version to match the changelog of the current package",
      },
    },
  },
}
