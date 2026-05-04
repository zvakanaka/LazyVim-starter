-- https://www.lazyvim.org/extras/lang/typescript#nvim-lspconfig
-- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      eslint = {},
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
            -- Let ESLint handle unused variables (like React imports)
            -- vtsls diagnostic 6133 = "declared but never read"
            -- ESLint's no-unused-vars and react/react-in-jsx-scope handle this properly
            preferences = {
              disableSuggestions = false,
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
        -- Filter out TypeScript's unused variable diagnostics
        -- ESLint will handle these checks instead
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, result, ctx)
            -- Filter out diagnostic 6133 (unused variables)
            -- This prevents vtsls from conflicting with ESLint's no-unused-vars
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return diagnostic.code ~= 6133
              end, result.diagnostics)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
          end,
        },
      },
    },
    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then
              return
            end
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" or client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end,
        })
      end,
    },
  },
}
