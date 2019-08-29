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

# Restore mackup 
mackup restore

# ruby
# https://github.com/rbenv/rbenv/issues/938
rbenv install 2.6.3
rbenv global 2.6.3
gem install bundler
bundle install

mkdir ~/.bin
cp $(bundle show tmuxinator)/completion/tmuxinator.zsh ~/.bin/tmuxinator.zsh 
