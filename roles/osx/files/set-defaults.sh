#!/bin/sh

# set reasonable macOS defaults
# inspired by : https://github.com/mathiasbynens/dotfiles
# more can be found here : https://gist.github.com/brandonb927/3195465

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "  › Use AirDrop over every interface. srsly this should be a default."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

echo "  › show the ~/Library folder"
chflags nohidden ~/Library

echo "  › disable smart quotes and smart dashes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "  › show path bar"
defaults write com.apple.finder ShowPathbar -bool true
