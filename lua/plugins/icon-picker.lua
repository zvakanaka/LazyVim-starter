-- https://github.com/ziontee113/icon-picker.nvim
return {
  "ziontee113/icon-picker.nvim",
  pin = true,
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>i", "<cmd>IconPickerNormal<cr>", opts)
    vim.keymap.set("n", "<leader>y", "<cmd>IconPickerYank<cr>", opts) -- yank the selected icon into register
  end,
}
