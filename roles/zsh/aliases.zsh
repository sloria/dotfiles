# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update!='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

alias cl="clear"
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'

alias reload!='. ~/.zshrc'
alias vi="vim"
alias v="vim"
# Syntax-highlight text from clipboard
# Requires highlight: brew install highlight
# Usage: hit js
function hit() {
  if [ -z "$2" ]
    then src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font 'Ubuntu Mono' --style solarized-light --font-size 24 | pbcopy
}
