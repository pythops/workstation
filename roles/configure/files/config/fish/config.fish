##
## Config
##

fish_vi_key_bindings

set -U fish_greeting
set -gx EDITOR 'nvim'
set -gx LANG en_US.UTF-8

fish_add_path $HOME/.local/bin $HOME/.npm-packages/bin $HOME/.cargo/bin $HOME/.python/bin $HOME/.krew/bin


##
## Alias
##
alias upgrade="yay ; rustup update"
alias cat="bat"
alias ls="eza -g -H -h --git"
alias find="fd"
alias ps="procs"
alias l="ls -l"
alias la="l -a"
alias ld="l -D"
alias vim="nvim"
alias vi="nvim"
alias t="eza --tree --git-ignore"
alias pdf="zathura"
alias diff="difft"

alias kadm="kubectl -n kube-system "
alias k="kubectl"
alias kc="kubectx"

##
## Prompt
##

set -gx STARSHIP_CONFIG ~/.config/starship/config.toml
starship init fish | source

##
## FZF
##

set -gx _ZO_EXCLUDE_DIRS ".cache|.git|.venv|node_modules"
set -gx FZF_DEFAULT_OPTS '--border --height=60%'
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g '!.git' -g '!node_modules' -g '!.venv' 2>/dev/null"

##
## Zoxide
##

zoxide init fish | source

bind -M insert ctrl-f zi

##
## SSH Agent
##

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

##
## ESP
##

alias get_idf="source $HOME/esp/esp-idf/export.fish"

##
## i3 tmux
##

set -e I3SOCK

##
## X
##

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
