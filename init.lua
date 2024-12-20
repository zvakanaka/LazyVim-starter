-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- https://medium.com/usevim/changing-vims-title-713001d4049c
-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/
vim.opt.title = true
vim.opt.titlestring = "%-25.55F %a%r%m"
vim.opt.titlelen = 70

-- use non-relative line numbers
vim.opt.rnu = false

-- modified from https://www.reddit.com/r/neovim/comments/t12vhi/comment/hydr6xf
local ts_utils = require("nvim-treesitter.ts_utils")
local function copyJsonPath()
  local result = {}
  local node = ts_utils.get_node_at_cursor()
  while node do
    if tostring(node) == "<node pair>" then
      local key_node = node:named_child(0):named_child(0)
      table.insert(result, 1, ts_utils.get_node_text(key_node)[1])
    end
    node = node:parent()
  end
  local path = vim.fn.join(result, ".")
  print(path)
  vim.api.nvim_command("let @+ = '" .. path .. "'")
end
vim.keymap.set("n", "<leader>nn", copyJsonPath)

local function dailyNote()
  local filename = "~/dev/Vault/Work/" .. os.date("%B %d, %Y") .. ".md"
  vim.cmd("e " .. filename)
end
vim.keymap.set("n", "<leader>nd", dailyNote)

-- change link into markdown link (e.g. url -> [](url)) and place cursor between brackets
vim.keymap.set("n", "<leader>ml", "viWda[](<esc>pa)<esc>F[a", {
  desc = "Change link into markdown link",
})

-- insert markdown checkbox at beginning of line
vim.keymap.set("n", "<leader>mc", "I- [ ] <esc>", {
  desc = "Insert markdown checkbox",
})
-- check checkbox of current line
vim.keymap.set("n", "<leader>mt", "^3<right>rx<esc>", {
  desc = "Check markdown checkbox",
})
