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
          ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            -- Filter out diagnostic 6133 (unused variables)
            -- This prevents vtsls from conflicting with ESLint's no-unused-vars
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return diagnostic.code ~= 6133
              end, result.diagnostics)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
          end,
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          -- vim.notify("LSP client attached: " .. client.name, vim.log.levels.INFO)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
