-- Leader
vim.g.mapleader = " "

-- Navigation key mapping
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

-- Disable arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Up>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Down>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Left>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Right>", "<NOP>", { noremap = true })

-- Clean highlight
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true })

-- Toggle spell
vim.api.nvim_set_keymap("n", "<leader>c", ":set spell!<CR>", { noremap = true })
