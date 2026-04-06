_auto_gh_account() {
  [[ -z "$GIT_ALT_PATH" ]] && return
  if [[ "$PWD" = "${GIT_ALT_PATH}" || "$PWD" = "${GIT_ALT_PATH}"/* ]]; then
    if [[ "$GH_TOKEN" != "$GH_TOKEN_ALT" ]]; then
      echo "gh: switched to alt account"
      export GH_TOKEN="$GH_TOKEN_ALT"
    fi
  else
    if [[ -n "$GH_TOKEN" ]]; then
      echo "gh: switched to default account"
      unset GH_TOKEN
    fi
  fi
}
chpwd_functions+=(_auto_gh_account)
