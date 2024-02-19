return {
  "f-person/git-blame.nvim",
  {
    "ruifm/gitlinker.nvim",
    -- fork with updated features/bugs:
    -- 'linrongbin16/gitlinker.nvim',
    config = function()
      require("gitlinker").setup()
    end,
  },
}
