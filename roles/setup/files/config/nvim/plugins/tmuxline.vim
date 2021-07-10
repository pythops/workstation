let g:airline#extensions#tmuxline#enabled = 1

let g:tmuxline_preset = {
  \'a'    : '#S',
  \'win'  : [ '#I', '#W' ],
  \'cwin' : [ '#I', '#W', '#F' ],
  \'x'    : '#(date +"%A %d %B %Y - %k:%M")',
  \'y'    : '#H #{prefix_highlight}'
  \}

let g:tmuxline_theme = 'airline_visual'

let airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"
