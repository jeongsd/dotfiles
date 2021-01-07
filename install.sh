#!/bin/sh

echo "Setting up JSD Mac..."

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
	echo "Install Homebrew"
	cd ~
	mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
	sudo mv homebrew /opt/homebrew

fi

# Update Homebrew recipes
brew update

