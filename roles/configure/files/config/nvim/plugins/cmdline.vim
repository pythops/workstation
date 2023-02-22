lua <<EOF
  vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
  require('fine-cmdline').setup({
    cmdline = {
         prompt = ' '
    },
    popup = {
        relative = 'editor',
        border = {
          style = 'rounded',
          text = {
              top = ' Command ',
               top_align = 'center',
              },
        },
    },
  })
EOF
