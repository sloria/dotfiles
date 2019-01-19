# HACK: This is to get coc.nvim working (which relies on vim-node-rpc)
# Without this, the node bin/ directory
# won't always be in $PATH (since we lazy-load nvm)
export PATH="$HOME/.nvm/versions/node/v8.11.2/bin:$PATH"
