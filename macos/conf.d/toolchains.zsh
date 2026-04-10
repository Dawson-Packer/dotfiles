for dir in "$TOOLCHAINS_DIR"/*/bin; do
    [[ -d "$dir" ]] && export PATH="$dir:$PATH"
done