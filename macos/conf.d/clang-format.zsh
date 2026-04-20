init-clang-format() {
  local format_dir="$DOTFILES_DIR/clang-format"
  local name="$1"

  if [[ -z "$name" ]]; then
    echo "Usage: init-clang-format <format-name>"
    echo "Available formats:"
    ls "$format_dir"
    return 1
  fi

  local source="$format_dir/$name"

  if [[ ! -f "$source" ]]; then
    echo "Error: '$name' not found in $format_dir"
    echo "Available formats:"
    ls "$format_dir"
    return 1
  fi

  if [[ -f ".clang-format" ]]; then
    echo "Error: .clang-format already exists in $(pwd)"
    return 1
  fi

  cp "$source" "./.clang-format"
  echo "✔ Copied '$name' to $(pwd)/.clang-format"
}
