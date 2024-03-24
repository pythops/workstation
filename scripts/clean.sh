#!/usr/bin/env bash

target=$1

available_targets=(
  "neovim"
)

if echo "${available_targets[@]}" | grep -qw "$target"; then
  case $target in
  neovim)
    killall nvim 2>/dev/null
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.cache/nvim
    ;;
  esac
else
  echo "Unknown target"
  echo "the available targets are:"
  for t in "${available_targets[@]}"; do
    echo "$t"
  done
  exit 1
fi
