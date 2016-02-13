# settings
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit # for autocomp

source ~/.bashrc

export SAVEHIST=50000
export HISTSIZE=50000
export HISTFILE=~/.zsh_history

# bindings
bindkey '^R' 'history-incremental-search-backward'
