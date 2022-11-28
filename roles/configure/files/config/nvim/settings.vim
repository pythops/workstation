" Leader
let mapleader = "\<Space>"

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
