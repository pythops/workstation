return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<CR>", { silent = true })
  end,
}
