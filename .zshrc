alias ls='ls -FGlah'

autoload -Uz compinit && compinit
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' actionformats ' %F{5}[%F{2}%b%F{4}%c%F{3}%u %F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       ' %F{5}[%F{2}%b%F{4}%c%F{3}%u%F{5}]%f '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+='%F{1}?'
    fi
}

precmd () { vcs_info }

setopt AUTO_CD

setopt PROMPT_SUBST

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST 

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

export PROMPT=$'%F{yellow}%~%f${vcs_info_msg_0_}\n%F{%(?.green.red)}%(!.#.$)%f '

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools

alias branch='git branch'
alias switch='git switch'
