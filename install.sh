#!/bin/sh

echo "Setting up JSD Mac..."

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)


# Removes .mackup.cfg from $HOME (if it exists) and symlinks the .mackup.cfg file from the dotfiles
rm -rf $HOME/.mackup.cfg
ln -s $HOME/dotfiles/Mackup/.mackup.cfg $HOME/.mackup.cfg

mackup restore