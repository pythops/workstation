call plug#begin('~/.vim/plugged')

  " Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Theme
  Plug 'sainnhe/gruvbox-material'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Additional text objects
  Plug 'wellle/targets.vim'

  " Syntax checking
  Plug 'dense-analysis/ale'

  " Shows git diff in the sign column
  Plug 'airblade/vim-gitgutter'

  " Dockerfile syntax
  Plug 'ekalinin/Dockerfile.vim'

  " Tmux integration
  Plug 'tmux-plugins/vim-tmux'

  " Git plugin
  Plug 'tpope/vim-fugitive'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Dim inactive windows
  Plug 'TaDaa/vimade'

  " i3
  Plug 'mboughaba/i3config.vim'

  " Highlight word under cursor and all of its occurrences
  Plug 'dominikduda/vim_current_word'

  " Multiple cursors
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " CamelCase Motions
  Plug 'bkad/CamelCaseMotion'

  " Highlight yanked text
  Plug 'machakann/vim-highlightedyank'

  Plug 'pechorin/any-jump.vim'

  " Show the indention level
  Plug 'Yggdroot/indentLine'

  " Autocompletion
  Plug 'davidhalter/jedi-vim'

  " Use Tab for completion
  Plug 'ervandew/supertab'

  "helpers for shell commands
  Plug 'tpope/vim-eunuch'

  " toml highlights
  Plug 'cespare/vim-toml'

  " Enable . for plugins
  Plug 'tpope/vim-repeat'

  " Vim sessions
  Plug 'tpope/vim-obsession'
  Plug 'dhruvasagar/vim-prosession'

  " Changes easly quotes and parentheses
  Plug 'tpope/vim-surround'

  " Enhances Vim's integration with the terminal
  Plug 'wincent/terminus'

  " Automated bullets lists
  Plug 'dkarter/bullets.vim'

  " Easy resizing of splits
  Plug 'simeji/winresizer'

  " Latex
  Plug 'lervag/vimtex'

  " Comments
  Plug 'tpope/vim-commentary'

  " Just
  Plug 'NoahTheDuke/vim-just'

  " Easy navigation
  Plug 'ggandor/leap.nvim'

  " Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

call plug#end()
