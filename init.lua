-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- https://medium.com/usevim/changing-vims-title-713001d4049c
-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/
vim.opt.title = true
-- 
vim.opt.titlestring = "%-25.55F %a%r%m"
vim.opt.titlelen = 70

-- use non-relative line numbers
vim.opt.rnu = false

local function dailyNote()
  local filename = "~/dev/Vault/Work/" .. os.date("%B %d, %Y") .. ".md"
  vim.cmd("e " .. filename)
end
vim.keymap.set("n", "<leader>nd", dailyNote)

-- change link into markdown link (e.g. url -> [](url)) and place cursor between brackets (use register 'p')
vim.keymap.set("n", "<leader>ml", 'viW"pda[](<esc>"ppa)<esc>F[a', {
  desc = "Change link into markdown link",
})

-- change visual selection into markdown link (e.g. selected text -> [selected text]())
vim.keymap.set("v", "<leader>ml", '"pda[<esc>"ppa]()<left>', {
  desc = "Change visual selection into markdown link",
})

-- delete mark (e.g. <leader>dm a)
vim.keymap.set("n", "<leader>dm", function()
  local mark = vim.fn.getchar()
  ---@diagnostic disable-next-line param-type-mismatch
  mark = string.char(mark)
  if mark ~= "" then
    vim.cmd("echom 'Mark: " .. mark .. "'")
    vim.cmd("delmark " .. mark)
  else
    vim.cmd("echom 'Invalid mark: " .. mark .. "'")
  end
end, {
  desc = "Delete mark",
})

-- insert markdown checkbox at beginning of line
vim.keymap.set("n", "<leader>mc", "I- [ ] <esc>", {
  desc = "Insert markdown checkbox",
})
-- check checkbox of current line
vim.keymap.set("n", "<leader>mt", "^3<right>rx<esc>", {
  desc = "Check markdown checkbox",
})

-- open ~/.config/nvim/init.lua in a vsplit window bottom right
vim.keymap.set("n", "<leader>ev", ":vsplit ~/.config/nvim/init.lua<cr>", {
  desc = "Edit init.lua",
})
-- source ~/.config/nvim/init.lua
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.lua<cr>", {
  desc = "Source init.lua",
})

-- <leader> h1 to prefix current line with # (H1), <leader> H2 to prefix current line with ## (H2), etc.
for i = 1, 6 do
  vim.keymap.set("n", "<leader>h" .. i, "I#" .. string.rep("#", i - 1) .. " <esc>", {
    desc = "Insert H" .. i .. " markdown header",
  })
end

-- jk to escape from insert mode
vim.keymap.set("i", "jk", "<esc>l", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<esc>l", { noremap = true, silent = true })

-- abbrev cosnt const
vim.cmd("abbreviate cosnt const")
-- vim.cmd("cnoreabbrev cl console.log(")

-- testOnly function to change test( or it( to test.only( or it.only( for the closest test on a line above cursor
local function testOnly()
  local replaced = false
  -- loop through lines above cursor

  for i = vim.fn.line("."), 1, -1 do
    local line = vim.fn.getline(i)
    -- if .only is already present, remove it
    if string.match(line, "test.only%(") then
      -- display message with echom
      vim.cmd("echom 'Removed .only from test on line " .. i .. "'")
      replaced = true

      -- from
      --   test.only('Catalog should have a surname', async () => {
      -- to
      --   test('Catalog should have a surname', async () => {
      local newLine = string.gsub(line, "test.only%(", "test(")
      vim.fn.setline(i, newLine)

      break
    elseif string.match(line, "it.only%(") then
      -- display message with echom
      vim.cmd("echom 'Removed .only from it on line " .. i .. "'")
      replaced = true

      -- from
      --   it.only('should work correctly', async () => {
      -- to
      --   it('should work correctly', async () => {
      local newLine = string.gsub(line, "it.only%(", "it(")
      vim.fn.setline(i, newLine)

      break
    end
    vim.cmd("echom 'Line " .. i .. "'") -- .. ": " .. line .. "'")
    -- if line contains test(, replace with test.only(
    if string.match(line, "test%(") then
      -- display message with echom
      vim.cmd("echom 'Added .only to test on line " .. i .. "'")
      replaced = true

      -- from
      --   test('Catalog should have a surname', async () => {
      -- to
      --   test.only('Catalog should have a surname', async () => {
      local newLine = string.gsub(line, "test%(", "test.only(")
      vim.fn.setline(i, newLine)

      break
    -- if line contains it(, replace with it.only(
    elseif string.match(line, "it%(") then
      -- display message with echom
      vim.cmd("echom 'Added .only to it on line " .. i .. "'")
      replaced = true

      -- from
      --   it('should work correctly', async () => {
      -- to
      --   it.only('should work correctly', async () => {
      local newLine = string.gsub(line, "it%(", "it.only(")
      vim.fn.setline(i, newLine)

      break
    end
  end
  -- if no test found, display message with echom
  if not replaced then
    vim.cmd("echom 'No test or it found to add .only to'")
  end
end
-- add keymap to add .only to closest test or it above cursor
vim.keymap.set("n", "<leader>to", testOnly, {
  desc = "Add/remove .only to closest test or it above cursor",
})

-- open new kitty window and yarn test current file
vim.keymap.set("n", "<leader>tt", ":!kitty @ launch --cwd current yarn test %<cr>", {
  desc = "Open new kitty window and yarn test current file",
})

-- toggle LSP
vim.keymap.set("n", "<leader>ue", function()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    -- Stop all clients and reload buffer (official recommended approach)
    vim.lsp.stop_client(vim.lsp.get_clients())
    vim.cmd("echo 'LSP stopped'")
  else
    -- Reload the buffer to restart LSP
    vim.cmd("edit")
    vim.cmd("echo 'LSP starting'")
  end
end, {
  desc = "Toggle LSP",
})

-- copy current file path to clipboard
vim.keymap.set("n", "<leader>cp", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
  vim.cmd("echo 'Copied file path: " .. file_path .. "'")
end, {
  desc = "Copy current file path to clipboard",
})

vim.keymap.set(
  "n",
  "<leader>tf",
  "irequire('fs').writeFileSync(`${process.env.HOME}/Desktop/test.html`, document.body.innerHTML)<esc>F(`a",
  { desc = "Insert fs.writeFileSync snippet" }
)
