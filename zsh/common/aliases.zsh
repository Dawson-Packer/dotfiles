
if has eza; then
    alias ls='eza'
    alias la='eza -lahG'
    alias ll='eza -lhG'X
else
    alias ll='ls -l'
    alias la="ls -la"
fi

alias cl="clear"
alias rmf="rm -rf"
alias cu="cd .."
alias ex="exec"
