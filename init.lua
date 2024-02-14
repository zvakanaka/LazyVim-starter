-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- https://medium.com/usevim/changing-vims-title-713001d4049c
-- " enable setting title
-- set title
-- " configure title to look like: Vim /path/to/file
-- set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

-- https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/
vim.opt.title = true
vim.opt.titlestring = "%-25.55F %a%r%m"
vim.opt.titlelen = 70

-- use non-relative line numbers
vim.opt.rnu = false

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- require("lspconfig").tsserver.setup({
--   capabilities = capabilities,
--   init_options = { preferences = { disableSuggestions = true } },
--   format = false,
--   completions = false,
--   inlayHints = false,
--   diagnostics = false,
-- })
