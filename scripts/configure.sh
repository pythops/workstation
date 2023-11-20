#!/usr/bin/env bash

set -e

target=$1

available_targets=(
    "all"
    "containers"
    "dnsmasq"
    "esp"
    "git"
    "go"
    "gpu"
    "i3"
    "keyboard"
    "lua"
    "minikube"
    "neovim"
    "npm"
    "packages"
    "python"
    "rust"
    "starship"
    "tmux"
    "wezterm"
    "yay"
    "zathura"
    "zsh"
)

if echo "${available_targets[@]}" | grep -qw "$target"; then
    if [ -v SUDO_WITHOUT_PASSWORD ]; then
        ansible-playbook configure.yaml -t "$1"
    else
        ansible-playbook configure.yaml -K -t "$1"
    fi
else
    echo "Unknown target"
    echo "the available targets are:"
    for t in "${available_targets[@]}"; do
        echo "$t"
    done
    exit 1
fi
