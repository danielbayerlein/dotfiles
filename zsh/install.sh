#!/bin/sh

if [ ! -d ~/.zplug ]; then
  echo '🌺 Installing Zsh plugin manager'
  curl -sL --proto-redir -all,https \
    https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
