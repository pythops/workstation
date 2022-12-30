call plug#begin('~/.vim/plugged')

  " Status bar
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  " Theme
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'sainnhe/gruvbox-material'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'NoahTheDuke/vim-just'

  " Additional text objects
  Plug 'wellle/targets.vim'

  " Shows git diff in the sign column
  Plug 'lewis6991/gitsigns.nvim'

  " Git plugin
  Plug 'tpope/vim-fugitive'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Dim inactive windows
  Plug 'levouh/tint.nvim'

  " Highlight word under cursor
  Plug 'RRethy/vim-illuminate'

  " Multiple cursors
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " CamelCase Motions
  Plug 'bkad/CamelCaseMotion'

  " Highlight yanked text
  Plug 'machakann/vim-highlightedyank'

  " Show the indention level
  Plug 'lukas-reineke/indent-blankline.nvim'

  "helpers for shell commands
  Plug 'tpope/vim-eunuch'

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
  Plug 'numToStr/Comment.nvim'

  " Easy navigation
  Plug 'ggandor/leap.nvim'

  "Close pairs
  Plug 'windwp/nvim-autopairs'

  " Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  "Show todo
  Plug 'folke/todo-comments.nvim'

  "coe diagnostics/formatting/linting
  Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()
