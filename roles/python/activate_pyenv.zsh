if command -v pyenv 1>/dev/null 2>&1; then
  # prezto's python module initializes pyenv
  # eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
