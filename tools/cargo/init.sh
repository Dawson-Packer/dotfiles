# Only load if rustup/cargo exists
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

export PATH="$HOME/.cargo/bin:$PATH"