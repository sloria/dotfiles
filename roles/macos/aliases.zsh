alias cask="brew cask"
alias services="brew services"

function sha256() {
  shasum -a 256 $1 | head -1 | grep -o '^\S\+'
}

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update!='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# When you need disk space
alias cleanup!='brew cleanup'
