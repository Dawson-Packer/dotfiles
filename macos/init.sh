#!/usr/bin/env bash

CONFIG_DIR="$DOTFILES_DIR/macos"

ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$CONFIG_DIR/zshenv" "$HOME/.zshenv"
ln -sf "$CONFIG_DIR/zshrc" "$HOME/.zshrc"