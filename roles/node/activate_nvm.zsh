export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# --no-use lazy-loads nvm until you run nvm use: https://github.com/nvm-sh/nvm?tab=readme-ov-file#additional-notes
# This speeds up shell startup time significantly
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
