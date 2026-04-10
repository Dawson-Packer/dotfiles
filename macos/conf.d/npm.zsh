export NVM_DIR="$HOME/.nvm"

# Load nvm only when the 'nvm' command is used
# nvm() {
#     unset -f nvm node npm npx
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#     nvm "$@"
# }

# node() {
#     nvm use default >/dev/null 2>&1
#     command node "$@"
# }

# npm() {
#     nvm use default >/dev/null 2>&1
#     command npm "$@"
# }

# npx() {
#     nvm use default >/dev/null 2>&1
#     command npx "$@"
# }