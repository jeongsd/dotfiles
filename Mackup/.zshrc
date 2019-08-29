source <(antibody init)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jsd/.oh-my-zsh"

# ZSH_THEME="spaceship"


plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  autojump
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

antibody bundle denysdovhan/spaceship-prompt
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle lukechilds/zsh-nvm

# https://github.com/tmuxinator/tmuxinator
export EDITOR='code'
# nvm_auto_switch

# place this after nvm initialization!
# https://github.com/nvm-sh/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# https://github.com/rbenv/rbenv/issues/938
eval "$(rbenv init -)"

# https://github.com/tmuxinator/tmuxinator#completion
source ~/.bin/tmuxinator.zsh
