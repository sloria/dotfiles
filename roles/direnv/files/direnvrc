# https://github.com/direnv/direnv/wiki/Node#using-nvm
use_nvm() {
  local node_version=$1

  nvm_sh=~/.nvm/nvm.sh
  if [[ -e $nvm_sh ]]; then
    source $nvm_sh
    nvm use $node_version
  fi
}
