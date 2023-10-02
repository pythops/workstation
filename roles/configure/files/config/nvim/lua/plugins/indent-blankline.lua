return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v2.20.8",
  config = function()
    vim.opt.list = true

    vim.cmd([[highlight IndentBlanklineContextStart guisp=#B16286 gui=underline]])
    vim.cmd([[highlight IndentBlanklineContextChar guifg=#B16286 gui=nocombine]])

    require("indent_blankline").setup({
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    })
  end,
}
