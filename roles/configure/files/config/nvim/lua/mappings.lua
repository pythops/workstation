-- Leader
vim.g.mapleader = " "

-- Navigation key mapping
vim.api.nvim_set_keymap("", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-H>", "<C-W><C-H>", { noremap = true })

-- Disable arrow keys
vim.api.nvim_set_keymap("", "<Up>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("", "<Down>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("", "<Left>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("", "<Right>", "<NOP>", { noremap = true })

-- Clean highlight
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true })

-- Toggle spell
vim.api.nvim_set_keymap("n", "<leader>c", ":set spell!<CR>", { noremap = true })
