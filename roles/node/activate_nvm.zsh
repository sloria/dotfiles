# Lazily load nvm so that it doesn't slow down shell startup time
# https://github.com/creationix/nvm/issues/782
export NVM_DIR="$HOME/.nvm"
group_lazy_load $HOME/.nvm/nvm.sh nvm node npm npx yarn
