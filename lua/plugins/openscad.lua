-- disable unless following statement is commented out
-- stylua: ignore
if true then return {} end

return {
  "salkin-mada/openscad.nvim",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "junegunn/fzf.vim",
  },
  config = function()
    require("openscad")
    -- load snippets, note requires
    vim.g.openscad_load_snippets = true
    vim.g.openscad_fuzzy_finder = "skim"
    vim.g.openscad_cheatsheet_window_blend = 15 --%
    vim.g.openscad_default_mappings = true
  end,
}
