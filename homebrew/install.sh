#!/bin/sh

if ! command -v brew &> /dev/null; then
  echo '🍺 Installing Homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! brew analytics state | grep -q 'disabled'; then
  echo '⛔️ Turn Homebrew''s analytics off'
  brew analytics off
fi

if ! brew bundle check --global; then
  echo '📦 Running `brew bundle install` to install desired packages'
  brew bundle install --global
fi
