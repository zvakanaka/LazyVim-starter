-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set({ "n" }, "<C-k>", function()
--   require("lsp_signature").toggle_float_win()
-- end, { silent = true, noremap = true, desc = "toggle signature" })

-- https://www.lazyvim.org/configuration/general#keymaps
local map = vim.keymap.set
-- Use alt for mac instead of ctrl
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map({ "n", "v" }, "c", '"_c', { noremap = true, desc = "Change without moving the change to a register" })
map({ "n", "v" }, "C", '"_C', { noremap = true, desc = "Change without moving the change to a register" })

-- emacs/readline keybindings (some taken from https://github.com/sei40kr/nvimacs)
-- TODO: maybe look into https://github.com/tpope/vim-rsi
map({ "i" }, "<C-a>", "<Home>", { silent = true })
map({ "i" }, "<C-e>", "<End>", { silent = true })
map({ "i" }, "<C-b>", "<Left>", { silent = true })
map({ "i" }, "<C-f>", "<Right>", { silent = true })
map({ "i" }, "<C-p>", "<Up>", { silent = true })
map({ "i" }, "<C-n>", "<Down>", { silent = true })
map({ "i" }, "<C-d>", "<Del>", { silent = true })
map({ "i" }, "<C-w>", "<C-o>db", { silent = true })
vim.keymap.set("c", "<M-b>", "<S-Left>", { silent = true })
vim.keymap.set("i", "<M-f>", "<C-o>e<Right>", { silent = true })
vim.keymap.set("c", "<M-f>", "<S-Right>", { silent = true })
-- scroll-down-command
vim.keymap.set("i", "<M-v>", "<PageUp>", { silent = true })
-- scroll-up-command
vim.keymap.set("i", "<C-v>", "<PageDown>", { silent = true })
-- delete-char
vim.keymap.set("!", "<C-d>", "<Del>", { silent = true })
-- kill-region
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true })
-- kill-line
vim.keymap.set("i", "<C-k>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  if #line <= col then
    return "<Del><C-o>dw"
  end

  return "<C-o>dw"
end, { silent = true, expr = true })
vim.keymap.set("c", "<C-k>", "<C-f>d$<C-c><End>", { silent = true })
