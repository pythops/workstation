call plug#begin('~/.vim/plugged')

  " Nerdtree
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

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

  " Theme
  Plug 'sainnhe/gruvbox-material'

  " Git plugin
  Plug 'tpope/vim-fugitive'

  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'

  " fzf
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  " Dim inactive windows
  Plug 'TaDaa/vimade'
  Plug 'blueyed/vim-diminactive'

  " i3
  Plug 'mboughaba/i3config.vim'

  " Code search tool
  Plug 'dyng/ctrlsf.vim'

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

  " Vim undo tree viewer
  Plug 'simnalamburt/vim-mundo'

  " Move lines and selection easly
  Plug 'matze/vim-move'

  " Rainbow parentheses
  Plug 'luochen1990/rainbow'

  " Nicer Python indentation
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

  " Syntax checking
  Plug 'vim-syntastic/syntastic'

  " Enhances Vim's integration with the terminal
  Plug 'wincent/terminus'

  " Automated bullets lists
  Plug 'dkarter/bullets.vim'

  " Easy resizing of splits
  Plug 'simeji/winresizer'

call plug#end()
