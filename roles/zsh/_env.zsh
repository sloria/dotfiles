export TERM=xterm-256color
export EDITOR='mvim'
export VISUAL='mvim'
export GPG_TTY=$(tty)

# Settings for various CLIs I use
export PED_EDITOR='vim'
export KONCH_EDITOR='vim'
export FAM_SOURCE="$HOME/Dropbox/fam"
export FAM_EDITOR="vim"

# Used by karma: Since we use cask to install browsers, the bin files will be located
# in ~/Applications instead of /Applications (Mac-specific)
export CHROME_BIN="$HOME/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
export FIREFOX_BIN="$HOME/Applications/Firefox.app/Contents/MacOS/firefox-bin"
