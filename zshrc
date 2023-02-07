# settings
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit # for autocomp
autoload -Uz vcs_info

# vcs_info
zstyle ':vcs_info:*' actionformats '%F{242}%s%f:%F{111}%b%f'
zstyle ':vcs_info:*' formats '%F{242}%s%f:%F{111}%b%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

source ~/.bashrc

export SAVEHIST=50000
export HISTSIZE=50000
export HISTFILE=~/.zsh_history

setopt prompt_subst
setopt inc_append_history
setopt share_history

fpath=(~/_w/forks/zsh-completions/src $fpath)

# hack to get multiline prompt
precmd() {
  vcs_info
}
RPROMPT='${vcs_info_msg_0_}'
PROMPT='\
%B%F{075}%n@%m%f%b%F{10}:%f%F{242}%~%f \
%F{248}λ%f '

# ls after current directory is changed
chpwd() { ls }

# bindings
bindkey '^R' 'history-incremental-search-backward'

# bun completions
[ -s "/Users/stopa/.bun/_bun" ] && source "/Users/stopa/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/stopa/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
