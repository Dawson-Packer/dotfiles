#!/usr/bin/env bash

CONFIG_DIR="$DOTFILES_DIR/zsh"

ln -sf "$CONFIG_DIR/zshenv" "$HOME/.zshenv"
ln -sf "$CONFIG_DIR/zshrc" "$HOME/.zshrc"