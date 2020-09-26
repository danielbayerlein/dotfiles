#!/bin/sh

if ! command -v zplug &> /dev/null; then
  echo '🌺 Installing Zsh plugin manager'
  curl -sL --proto-redir -all,https \
    https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

if ! zplug check; then
  echo '🌺 Installing Zsh plugins'
  zplug install
fi
