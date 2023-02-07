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
sym gitconfig      .gitconfig
sym tmux.conf      .tmux.conf
sym zshrc          .zshrc
sym lein           .lein
sym nvim.vim       .config/nvim/init.vim

touch $DOTFILES/bash/local

echo "> Invasion successful!"
