# Lazily load nvm so that it doesn't slow down shell startup time
# https://github.com/creationix/nvm/issues/782#issuecomment-299669827
export NVM_DIR="$HOME/.nvm"
function nvm {
  # This loads nvm
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm use system
    nvm $@
  fi
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
