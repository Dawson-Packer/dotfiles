#~/usr/bin/env bash
set -e

SHELL_NAME="$1"

if [[ -z "$SHELL_NAME" ]]; then
    echo "Usage: ./install.sh [zsh|bash|powershell]"
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
    local source="$1"
    local target="$2"

    echo "Linking $target → $source"
    ln -sf "$source" "$target"
}

case "$SHELL_NAME" in
    zsh)
        source "$DOTFILES_DIR/shell/zsh/init.sh"
        ;;
    bash)
        source "$DOTFILES_DIR/shell/bash/init.sh"
        ;;
    powershell)
        echo "Run this from Powershell:"
        echo "  ./shell/powershell/init.ps1"
        ;;
    *)
        echo "Unsupported shell: $SHELL_NAME"
        exit 1
        ;;
esac

echo "Done. Successfully initialized dotfiles for $SHELL_NAME. Restart your shell to apply changes."