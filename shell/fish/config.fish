if type -q starship
    starship init fish | source
    set -gx STARSHIP_CONFIG "$DOTFILES_DIR/starship/starship.toml"
end