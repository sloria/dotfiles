if [[ -s "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
elif [[ "$OSTYPE" == darwin* ]] && (( $+commands[brew] )); then
  export PATH="$(brew --prefix rustup)/bin:$PATH"
fi
