return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}

    -- Initialize markdown linting based on global setting (default: enabled)
    if vim.g.markdown_lint_enabled == nil then
      vim.g.markdown_lint_enabled = true
    end

    opts.linters_by_ft.markdown = vim.g.markdown_lint_enabled and { "markdownlint-cli2" } or {}

    -- Configure markdownlint-cli2 to use global config from neovim directory
    local lint = require("lint")
    local config_path = vim.fn.stdpath("config") .. "/markdownlint.json"
    lint.linters["markdownlint-cli2"].args = {
      "--config",
      config_path,
    }

    return opts
  end,
  keys = {
    {
      "<leader>uk",
      function()
        vim.g.markdown_lint_enabled = not vim.g.markdown_lint_enabled
        local lint = require("lint")

        if vim.g.markdown_lint_enabled then
          lint.linters_by_ft.markdown = { "markdownlint-cli2" }
          vim.notify("Markdown linting enabled", vim.log.levels.INFO)
          -- Re-trigger linting on current buffer if it's markdown
          if vim.bo.filetype == "markdown" then
            lint.try_lint()
          end
        else
          lint.linters_by_ft.markdown = {}
          vim.notify("Markdown linting disabled", vim.log.levels.INFO)
          -- Clear existing diagnostics from markdownlint
          local ns = lint.get_namespace("markdownlint-cli2")
          if ns then
            vim.diagnostic.reset(ns)
          end
        end
      end,
      desc = "Toggle Markdown Linting",
    },
  },
}
