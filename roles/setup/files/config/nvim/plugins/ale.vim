scriptencoding utf-8

let g:ale_linters = {
\  'python': ['flake8', 'mypy', 'bandit'],
\  'ansible': ['ansible-lint'],
\  'json': ['jq'],
\  'yaml': ['prettier'],
\  'apiblueprint': ['drafter'],
\  'markdown': ['prettier'],
\  'rust': ['rustc', 'rls'],
\  'shell': ['shellcheck']
\}

let g:ale_fixers = {
\ 'python': ['black', 'isort'],
\ 'json': ['jq'],
\ 'yaml': ['prettier'],
\ 'rust': ['rustfmt'],
\ '*' : ['remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '!'
let g:ale_lint_delay = 500
let g:ale_statusline_format = ['%dE', '%dW', '']
let g:ale_list_window_size = 5

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
