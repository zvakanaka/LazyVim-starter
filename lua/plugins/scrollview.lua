return {
  "dstein64/nvim-scrollview",
  config = function()
    require("scrollview")

    vim.g.scrollview_excluded_filetypes = { "neo-tree", "nerdtree" }
    vim.g.scrollview_current_only = true
    -- vim.g.scrollview_base = "buffer"
    -- vim.g.scrollview_column = 80
    vim.g.scrollview_signs_on_startup = { "all" }
    vim.g.scrollview_diagnostics_severities = { vim.diagnostic.severity.ERROR }
  end,
}
