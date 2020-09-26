#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for linkable in $(find $DIR -name '.*' -maxdepth 2 -type f); do
  target=$HOME"/$(basename $linkable)"
  if [ ! -L $target ]; then
    echo "🔗 Linking $target → $linkable"
    ln -Ff -s $linkable $target
  fi
done

for executable in $DIR/**/*.sh; do
  echo "👟 Running $executable"
  sh $executable
done
