#!/usr/bin/env zsh
# install.zsh — Dotfiles macos installer

set -e

# ── Colors ────────────────────────────────────────────────────────────────────
BOLD='\033[1m'
DIM='\033[2m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
RESET='\033[0m'
 
# DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
 
INSTALL_DIR="$CONFIG_DIR/install"

# ── Helpers ───────────────────────────────────────────────────────────────────
print_header() {
  echo ""
  echo "${BOLD}${CYAN}╔══════════════════════════════════════╗${RESET}"
  echo "${BOLD}${CYAN}║       Dotfiles macOS Installer       ║${RESET}"
  echo "${BOLD}${CYAN}╚══════════════════════════════════════╝${RESET}"
  echo ""
}
 
print_section() {
  echo ""
  echo "${BOLD}${YELLOW}▶ $1${RESET}"
}
 
print_success() {
  echo "${GREEN}✔ $1${RESET}"
}
 
print_error() {
  echo "${RED}✘ $1${RESET}"
}
 
print_info() {
  echo "${DIM}  $1${RESET}"
}
 
install_brewfile() {
  local name="$1"
  local file="$INSTALL_DIR/Brewfiles/Brewfile.$name"
 
  print_info "Installing: $name"
 
  if [[ ! -f "$file" ]]; then
    print_error "Brewfile.$name not found at $file"
    return 1
  fi
 
  if brew bundle --file="$file"; then
    print_success "$name installed successfully"
  else
    print_error "$name had some errors (check output above)"
  fi
}
 
ensure_homebrew() {
  if ! command -v brew &>/dev/null; then
    print_section "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
  else
    print_info "Homebrew already installed ($(brew --version | head -1))"
  fi
}
  
ensure_fzf() {
  if ! command -v fzf &>/dev/null; then
    print_section "Installing fzf..."
    brew install fzf
    print_success "fzf installed"
  else
    print_info "fzf already installed ($(fzf --version))"
  fi
}

# ── Menu ──────────────────────────────────────────────────────────────────────
show_menu() {
  local categories=(
    "all"
    "minimal    — Core CLI tools and apps (git, eza, starship, iTerm.app, etc.)"
    "desktop    — Compilers (C/C++, Rust)"
    "embedded   — Embedded toolchains and other tools (gdb, openocd, qemu, etc.)"
    "web        — Web languages and runtimes (Deno, npm)"
    "python     — Python and its ecosystem (pyenv, tcl-tk, etc.)"
    "java       — JDK and its ecosystem"
  )

  printf '%s\n' "${categories[@]}" | fzf \
    --multi \
    --no-info \
    --layout=reverse \
    --bind space:toggle \
    --header "Select categories to install (Space to select, Enter to confirm)" \
    --prompt "▶ " \
    --height=~100% \
    --no-sort \
    --pointer="→" \
    --marker="✔" \
    --color="header:italic:cyan,prompt:white,pointer:cyan,marker:green" \
    | awk '{print $1}' # Only the first word from categories
}

show_complete() {
  echo ""
  echo "${BOLD}${GREEN}╔══════════════════════════════════════╗${RESET}"
  echo "${BOLD}${GREEN}║         Installation complete!       ║${RESET}"
  echo "${BOLD}${GREEN}╚══════════════════════════════════════╝${RESET}"
  echo ""
  exit 0
}
 
# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  print_header
  ensure_homebrew
  ensure_fzf
 
  echo ""
  print_section "What would you like to install?"
  echo "${DIM} Space to select, Enter to confirm, Ctrl-C to quit${RESET}"
  echo ""

  local choices
  choices=$(show_menu) || { echo ""; print_info "Nothing selected."; echo ""; }

  if [[ -z "$choices" ]]; then
    show_complete
  fi

  if grep -q "^all$" <<< "$choices"; then
    for category in minimal desktop embedded web python java; do
      source "$INSTALL_DIR/installers/$category.zsh"
    done
  else
    while IFS= read -r category; do
      source "$INSTALL_DIR/installers/$category.zsh"
    done <<< "$choices"
  fi

  show_complete
 
}
 
main "$@"
