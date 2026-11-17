if [[ -o interactive && ( -n $SSH_CONNECTION || $TERM == screen-256color ) ]]; then
    autoload -Uz add-zsh-hook
    murx_ssh_title() {
        local program=${1:t}
        printf '\033]2;%s:%s\007' "${HOST%%.*}" "$program"
        local directory=$PWD
        if [[ $directory == "$HOME" ]]; then
            directory='~'
        elif [[ $directory == "$HOME/"* ]]; then
            directory="~/${directory#"$HOME/"}"
        fi
        printf '\033]777;murx-cwd;%s\007' "$directory"
        printf '\033]777;murx-root;%s\007' "$((EUID == 0))"
    }
    murx_ssh_preexec() {
        local -a words
        words=(${(z)1})
        murx_ssh_title "${(Q)words[1]}"
    }
    murx_ssh_precmd() { murx_ssh_title zsh; }
    add-zsh-hook preexec murx_ssh_preexec
    add-zsh-hook precmd murx_ssh_precmd
fi

