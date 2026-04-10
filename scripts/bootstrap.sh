#~/usr/bin/env bash
set -e

OS_NAME="$1"

if [[ -z "$OS_NAME" ]]; then
    echo "Usage: ./install.sh [macos|linux|windows]"
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link_file() {
    local source="$1"
    local target="$2"

    echo "Linking $target → $source"
    ln -sf "$source" "$target"
}

case "$OS_NAME" in
    macos)
        source "$DOTFILES_DIR/macos/init.sh"
        ;;
    linux)
        source "$DOTFILES_DIR/linux/init.sh"
        ;;
    *)
        echo "Unsupported operating system: $OS_NAME"
        exit 1
        ;;
esac

echo "Done. Successfully initialized dotfiles for $OS_NAME. Restart your shell to apply changes."