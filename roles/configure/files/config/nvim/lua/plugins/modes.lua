return {
  "mvllow/modes.nvim",
  tag = "v0.2.0",
  config = function()
    require("modes").setup({
      colors = {
        visual = "#fe8019",
      },
    })
  end,
}
