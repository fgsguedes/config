function success_color {
    local status=$?
    if [[ $status -eq 0 ]]; then
        echo -e '\033[0;32m'
    else
        echo -e '\033[0;31m'
    fi
    return $status
}

function vcprompt_changes {
    status=$?
    if [[ -n "$(vcprompt)" ]]; then
        branch="$(vcprompt -f ' [%n:%b')"
        changes="$(vcprompt -f '%m')"
        untracked="$(vcprompt -f '%u')"

        echo -n "$branch"

        if [[ -n "$changes" ]] || [[ -n "$untracked" ]]; then
            echo -n " "
        fi

        echo -n "$changes$untracked]"
    fi
    return $status
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1="\[\033[33;1m\]\w\[\033[m\]\$(vcprompt_changes)\n\[\$(success_color)\]$\[\033[m\] "
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools

alias dunnet='emacs -batch -l dunnet'
alias ls='ls -GFlah'
