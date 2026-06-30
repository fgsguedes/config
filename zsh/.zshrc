alias gitc='git fetch --prune && git branch -vv | grep '\'': gone]'\'' | awk '\''{print $1}'\'' | xargs -r git branch -D ** git reflog expire --expire=now --all ** git gc --prune-now'
alias gw='./gradlew'
alias ls='ls -lah --color=auto'
alias top=btop

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

bindkey -e

[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' actionformats ' %F{5}[%F{6}%b%F{4}%c%F{3}%u %F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       ' %F{5}[%F{6}%b%F{4}%c%F{3}%u%F{5}]%f '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+='%F{1}?'
    fi
}

precmd () { vcs_info }

[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export SAVEHIST=1000
export HISTSIZE=1000

setopt PROMPT_SUBST
setopt AUTO_MENU AUTO_PARAM_SLASH
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY

export WORDCHARS=''

export PROMPT=$'%F{blue}%~%f${vcs_info_msg_0_}\n%F{%(?.green.red)}%(!.#.$)%f '

export PATH="$XDG_CONFIG_HOME/zsh/scripts:$PATH"

source "$XDG_CONFIG_HOME/zsh/fzf.sh"
eval "$(zoxide init --cmd cd zsh)"
