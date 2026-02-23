has brew || return

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

