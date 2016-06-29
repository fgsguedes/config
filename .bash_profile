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

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(vcprompt_changes)\n\[\$(success_color)\]$\[\033[m\] "
export JAVA_HOME=$(/usr/libexec/java_home)

alias ls='ls -GFlah'

alias dunnet='emacs -batch -l dunnet'

export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
