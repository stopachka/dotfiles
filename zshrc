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

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --sort-files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# bindings
bindkey '^R' 'history-incremental-search-backward'
