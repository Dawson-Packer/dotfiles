has starship || return

export STARSHIP_CONFIG="$DOTFILES_DIR/tools/starship/starship.toml"
eval "$(starship init "$SHELL")"

starship-profile() {
    export STARSHIP_PROFILE="$1"
    eval "$(starship init $SHELL)"
}

# # Enable Starship transient prompt
# enable_transient_prompt() {
#     emulate -L zsh
#     starship prompt --transient
# }

# case "$SHELL" in
#     zsh)
#         add-zsh-hook precmd enable_transient_prompt
#         ;;
# esac