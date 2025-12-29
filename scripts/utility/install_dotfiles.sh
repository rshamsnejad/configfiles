#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_DIR="$SCRIPT_DIR/../.."

cp -vi "$DOTFILES_DIR"/.bashrc ~
cp -vi "$DOTFILES_DIR"/.bash_aliases ~
cp -vi "$DOTFILES_DIR"/.vimrc ~
cp -vi "$DOTFILES_DIR"/.tmux.conf ~
mkdir -p ~/.config/fish
cp -vri "$DOTFILES_DIR"/.config/fish/* ~/.config/fish/
