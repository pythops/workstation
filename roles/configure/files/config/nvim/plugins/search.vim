lua <<EOF
  vim.api.nvim_set_keymap('n', '/', '<cmd>SearchBoxIncSearch<CR>', {noremap = true})
  require('searchbox').setup({
    popup = {
        position = {
            row = '10%',
            col = '50%',
        },
        size = {
            width = '60%',
        },
        relative = 'editor',
        border = {
          style = 'rounded',
          text = {
              top = ' Search ',
               top_align = 'center',
              },
        },
    },
  })
EOF
