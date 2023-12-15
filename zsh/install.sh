#!/bin/sh

if [ ! -d ~/.antidote ]; then
  echo '🌺 Installing Zsh plugin manager'
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi
