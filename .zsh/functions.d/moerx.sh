if [[ -n $SSH_CONNECTION ]]; then
    autoload -Uz add-zsh-hook
    moerx_ssh_title() {
        local program=${1:t}
        printf '\033]2;%s:%s\007' "${HOST%%.*}" "$program"
    }
    moerx_ssh_preexec() {
        local -a words
        words=(${(z)1})
        moerx_ssh_title "${(Q)words[1]}"
    }
    moerx_ssh_precmd() { moerx_ssh_title zsh; }
    add-zsh-hook preexec moerx_ssh_preexec
    add-zsh-hook precmd moerx_ssh_precmd
fi

