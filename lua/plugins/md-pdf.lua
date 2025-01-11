-- https://github.com/arminveres/md-pdf.nvim
return {
  "arminveres/md-pdf.nvim",
  branch = "main", -- you can assume that main is somewhat stable until releases will be made
  lazy = true,
  keys = {
    {
      "<leader>mp",
      function()
        require("md-pdf").convert_md_to_pdf()
      end,
      desc = "Markdown preview",
    },
  },
  opts = {
    -- color links blue
    pandoc_user_args = {
      "-V colorlinks:true",
    },
  },
}
