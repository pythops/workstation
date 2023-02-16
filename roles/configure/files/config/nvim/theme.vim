set termguicolors

set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_colors_override = {
          \ 'bg0':              ['#000000',   '255'],
          \ 'bg1':              ['#262727',   '235'],
          \ 'bg2':              ['#282828',   '235'],
          \ 'bg3':              ['#3c3836',   '237'],
          \ 'bg4':              ['#3c3836',   '237'],
          \ 'bg5':              ['#504945',   '239'],
          \ 'bg_statusline1':   ['#282828',   '235'],
          \ 'bg_statusline2':   ['#32302f',   '235'],
          \ 'bg_statusline3':   ['#504945',   '239'],
          \ 'bg_diff_green':    ['#32361a',   '22'],
          \ 'bg_visual_green':  ['#333e34',   '22'],
          \ 'bg_diff_red':      ['#3c1f1e',   '52'],
          \ 'bg_visual_red':    ['#442e2d',   '52'],
          \ 'bg_diff_blue':     ['#0d3138',   '17'],
          \ 'bg_visual_blue':   ['#2e3b3b',   '17'],
          \ 'bg_visual_yellow': ['#473c29',   '94'],
          \ 'bg_current_word':  ['#32302f',   '236'],
          \ 'fg0':              ['#d4be98',   '223'],
          \ 'fg1':              ['#ddc7a1',   '223'],
          \ 'red':              ['#ea6962',   '167'],
          \ 'orange':           ['#e78a4e',   '208'],
          \ 'yellow':           ['#d8a657',   '214'],
          \ 'green':            ['#a9b665',   '142'],
          \ 'aqua':             ['#89b482',   '108'],
          \ 'blue':             ['#7daea3',   '109'],
          \ 'purple':           ['#d3869b',   '175'],
          \ 'bg_red':           ['#ea6962',   '167'],
          \ 'bg_green':         ['#a9b665',   '142'],
          \ 'bg_yellow':        ['#d8a657',   '214'],
          \ 'grey0':            ['#7c6f64',   '243'],
          \ 'grey1':            ['#928374',   '245'],
          \ 'grey2':            ['#a89984',   '246'],
          \ 'none':             ['NONE',      'NONE']
          \ }

colorscheme gruvbox-material

highlight NormalFloat guibg=#000000
highlight FloatBorder guifg=#e78a4e guibg=#000000
highlight WarningFloat guibg=#000000
highlight ErrorFloat guibg=#000000
highlight InfoFloat guibg=#000000
highlight HintFloat guibg=#000000

lua <<EOF
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "python", "lua", "rust" },

      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      indent = {
        enable = true
      },
    }

    require'treesitter-context'.setup()
EOF
