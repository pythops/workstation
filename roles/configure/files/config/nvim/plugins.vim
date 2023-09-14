call plug#begin('~/.vim/plugged')
  " Common dependencies
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'

  " Status bar
  Plug 'nvim-lualine/lualine.nvim'

  " Theme
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context', {'requires': 'nvim-treesitter/nvim-treesitter'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'requires': 'nvim-treesitter/nvim-treesitter'}
  Plug 'm-demare/hlargs.nvim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'HiPhish/nvim-ts-rainbow2'
  Plug 'NoahTheDuke/vim-just'

  " Shows git diff in the sign column
  Plug 'lewis6991/gitsigns.nvim'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " telescope
  Plug 'nvim-telescope/telescope.nvim'

  " Dim inactive windows
  Plug 'levouh/tint.nvim'

  " Highlight word under cursor
  Plug 'RRethy/vim-illuminate'

  " CamelCase Motions
  Plug 'bkad/CamelCaseMotion'

  " Highlight yanked text
  Plug 'machakann/vim-highlightedyank'

  " Show the indention level
  Plug 'lukas-reineke/indent-blankline.nvim'

  "helpers for shell commands
  Plug 'tpope/vim-eunuch'

  " Text surrounding
  Plug 'kylechui/nvim-surround'

  " Automated bullets lists
  Plug 'dkarter/bullets.vim'

  " Easy resizing of splits
  Plug 'simeji/winresizer'

  " Comments
  Plug 'numToStr/Comment.nvim'

  " Easy navigation
  Plug 'ggandor/leap.nvim'

  "Close pairs
  Plug 'windwp/nvim-autopairs'

  " Lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

  "Show todo
  Plug 'folke/todo-comments.nvim'

  "Formatting
  Plug 'mhartington/formatter.nvim'

  "Linting
  Plug 'mfussenegger/nvim-lint'

  "Use treesitter to autoclose and autorename html tag
  Plug 'windwp/nvim-ts-autotag'

  " Icons
  Plug 'stevearc/dressing.nvim'
  Plug 'ziontee113/icon-picker.nvim'

  " Cmdline
  Plug 'MunifTanjim/nui.nvim'
  Plug 'VonHeikemen/fine-cmdline.nvim'

  " Search
  Plug 'VonHeikemen/searchbox.nvim'

  "Lazygit
  Plug 'kdheepak/lazygit.nvim'

call plug#end()
