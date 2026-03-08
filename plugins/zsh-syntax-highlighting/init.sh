_lazy_load_highlight() {
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  ZSH_HIGHLIGHT_STYLES[command]='fg=#fdc401,bold'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan,bold'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=#61d7d7,bold'
  ZSH_HIGHLIGHT_STYLES[function]='fg=white'
  ZSH_HIGHLIGHT_STYLES[path]='fg=#e3e3e3'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
  ZSH_HIGHLIGHT_STYLES[comment]='fg=8'
  ZSH_HIGHLIGHT_STYLES[string]='fg=#CA8178'
  ZSH_HIGHLIGHT_STYLES[gitcommit_string]='fg=#CA8178'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#CA8178'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#CA8178'
  ZSH_HIGHLIGHT_STYLES[default]='fg=#b3b3b3'

  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#607DD6'
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#7d7d7d'

  ZSH_HIGHLIGHT_STYLES[precommand]='fg=#60D66F,bold,underline'

  add-zsh-hook -d precmd _lazy_load_highlight
}
add-zsh-hook precmd _lazy_load_highlight
