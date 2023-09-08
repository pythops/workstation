" Leader
let mapleader = "\<Space>"

"Disable swap
set noswapfile

" Show line number
set number

" Clean highlight
nnoremap <esc> :noh<return><esc>

" Clipboard
set clipboard=unnamedplus

" Highlights
filetype plugin on
syntax on

"convert tab
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Navigation key mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Split panes to right and bottom
set splitbelow
set splitright

" Disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" Cursor config
set termguicolors
set cursorline
set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20,a:blinkon1


" Toggle spell
nnoremap <leader>c :set spell!<CR>

" Add wgsl file type
au BufNewFile,BufRead *.wgsl set filetype=wgsl

" Ansible file type
au BufRead,BufNewFile */roles/*.y*ml set filetype=yaml.ansible

" Github Actions file type
au BufRead,BufNewFile */.github/*.y*ml set filetype=yaml.github
