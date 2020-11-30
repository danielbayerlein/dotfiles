#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

target=$HOME/Library/Application\ Support/Code/User/settings.json
if [ ! -L "$target" ]; then
  linkable=$DIR/settings.json
  echo "🔗 Linking $linkable → $target"
  ln -s $linkable "$target"
fi
