lua << EOF
  require("todo-comments").setup()
EOF
nnoremap <C-t> :TodoTelescope<CR>
