has() {
    command -v "$1" >/dev/null 2>&1
}

clang-format-TODO() {
    cp "$DOTFILES_DIR/clang-format/embedded-format" "./.clang-format"
}