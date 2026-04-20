export STARSHIP_CONFIG="$DOTFILES_DIR/starship/starship.toml"
if [[ "$TERM_PROGRAM" == "iTerm.app" || "$TERM_PROGRAM" == "vscode" ]]; then
    eval "$(starship init $SHELL)"
fi