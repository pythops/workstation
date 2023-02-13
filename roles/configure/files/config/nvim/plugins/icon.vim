lua << EOF
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>i", "<cmd>IconPickerNormal<cr>", opts)

  require("icon-picker").setup({ disable_legacy_commands = true })
EOF
