# -----
# Env

set -o vi

# basics
export EDITOR='vim'
export TERM='xterm-256color'
export LANG='en_US.UTF-8'
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.histfile"

# -----
# Aliases

export CDPATH=".:$HOME/projects"

#!/usr/bin/env bash

# general
alias l='ls -lahG'
alias psimple="python -m SimpleHTTPServer"

# python
alias jp="jupyter"
alias jpn="jp notebook"

# git
alias g='git status'
alias gst='git status'
alias gf='git fetch'
alias gm='git merge'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gck='git checkout'
alias gd='git diff'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gg='git grep'
alias glo='git log'
alias gl='git pull'
alias gp='git push'
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%ad>%Creset' --abbrev-commit --date=short"
alias ghu="git push heroku master"

function gpm() {
  ga -A && gc -m $1 && gp
}

function gh-publish() {
  git checkout -B gh-pages
  git add -f build
  git commit -am "Rebuild website"
  git filter-branch -f --prune-empty --subdirectory-filter build
  git push -f origin gh-pages
  git checkout -
}

. ~/dotfiles/local