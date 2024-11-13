return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        always_show = { -- remains visible even if other settings would normally hide it
          "Work",
        },
      },
    },
  },
}
