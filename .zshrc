#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR="subl -n -w"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/share/npm/bin:$PATH
eval "$(rbenv init -)"

# Base16 Shell
if [[ -s "$HOME/.config/base16-shell/base16-ocean.dark.sh" ]]; then
  source "$HOME/.config/base16-shell/base16-ocean.dark.sh"
fi
