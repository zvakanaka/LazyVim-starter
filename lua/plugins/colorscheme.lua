-- NOTE: Cursor color is something you set in your terminal emulator.
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        style = "light",
        -- not working with light for some reason:
        -- transparent_mode = true,
      })
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    priority = 1000,
    config = function()
      local auto_dark_mode = require("auto-dark-mode")
      auto_dark_mode.setup({
        update_interval = 3000,
        set_dark_mode = function()
          vim.cmd("echom '🕯️Dark mode'")
          vim.api.nvim_set_option_value("background", "dark", {})
          vim.cmd("colorscheme tokyonight")
        end,
        set_light_mode = function()
          vim.cmd("echom '☀️ Light mode'")
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd("colorscheme gruvbox")
        end,
      })
    end,
  },
}
