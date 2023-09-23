-- Disable swap
vim.opt.swapfile = false

-- Disable the mouse
vim.opt.mouse = ""

-- Show line number
vim.opt.number = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlights
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

-- Tab settings
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.api.nvim_set_keymap("i", "<Tab>", "<C-t>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap = true })

-- Split panes to right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Cursor config
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Add wgsl file type
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  command = "set filetype=wgsl",
})

-- Ansible file type
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/roles/*.y*ml",
  command = "set filetype=yaml.ansible",
})

-- Github Actions file type
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/.github/*.y*ml",
  command = "set filetype=yaml.github",
})

--i3
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".*/i3/config",
  command = "set filetype=i3config",
})

-- Add line text object
vim.api.nvim_set_keymap("x", "il", "g_o^", { noremap = true })
vim.api.nvim_set_keymap("o", "il", ":normal vil<CR>", { noremap = true })
vim.api.nvim_set_keymap("x", "al", "$o^", { noremap = true })
vim.api.nvim_set_keymap("o", "al", ":normal val<CR>", { noremap = true })

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
