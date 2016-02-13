#!/usr/bin/env sh

set -ex

PREFIX="$HOME"
DOTFILES="$PREFIX/dotfiles"
BACKUPS="$PREFIX/backups"

function sym () {
  src="$DOTFILES/$1"
  dest="$PREFIX/$2"

  if [ -e "$dest" ]; then
    newdest="$BACKUPS/$(basename $dest)-$(date +%s)"
    mv "$dest" "$newdest"
    echo "> Moved $dest to $newdest"
  fi

  ln -s "$src" "$dest"
}

if [ ! -e "$DOTFILES" ]; then
  echo "error: dotfiles/ needs to reside in $PREFIX"
  exit 1
fi

mkdir -p "$PREFIX"
mkdir -p "$BACKUPS/vim_backups"

sym bashrc         .bashrc
sym ackrc          .ackrc
sym zshrc          .zshrc
sym tmux           .tmux
sym tmux/tmux.conf .tmux.conf

touch $DOTFILES/bash/local

# Atom
sym atom/keymap.cson .atom/keymap.cson
sym atom/snippets.cson .atom/snippets.cson

# IntelliJ Idea
sym idea/idea.vmoptions  Library/Preferences/IdeaIC15/idea.vmoptions
sym idea/idea.properties Library/Preferences/IdeaIC15/idea.properties

echo "> Invasion successful!"
