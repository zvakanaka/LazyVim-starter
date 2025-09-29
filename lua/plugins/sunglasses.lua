-- disable until I get this config working well with Lazygit
if true then
  return {}
end
return {
  "miversen33/sunglasses.nvim",
  config = {
    filter_type = "NOSYNTAX", -- "SHADE" | "NOSYNTAX" | "TINT"
    filter_percent = 0.5,
    refresh_timer = 5,
    excluded_filetypes = {
      "snacks_terminal",
      -- "dashboard",
      "checkhealth",
      "mason",
      -- "NvimTree",
      -- "neo-tree",
      -- "plugin",
      -- "lazy",
      -- "TelescopePrompt",
      -- "alpha",
      -- "toggleterm",
      -- "sagafinder",
      -- "better_term",
      -- "fugitiveblame",
      -- "starter",
      -- "NeogitPopup",
      -- "NeogitStatus",
      -- "DiffviewFiles",
      -- "DiffviewFileHistory",
      -- "DressingInput",
      -- "spectre_panel",
      -- "zsh",
      -- "registers",
      -- "startuptime",
      -- "OverseerList",
      -- "Outline",
      -- "Navbuddy",
      -- "noice",
      -- "notify",
      -- "saga_codeaction",
      -- "sagarename",
    },
  },
}
