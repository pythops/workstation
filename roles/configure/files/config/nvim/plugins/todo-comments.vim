lua << EOF
  vim.api.nvim_set_keymap('n', '<leader>t', ':TodoTelescope<CR>', { noremap = true, silent = true })
  require("todo-comments").setup()
EOF
