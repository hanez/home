alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias c='clear'

if [ -e "/usr/bin/bat" ]; then
  alias cat='bat'
elif [ -e "/usr/bin/batcat" ]; then
  alias cat='batcat'
fi

alias gita='git add'
alias gitc='git commit'
alias gitd='git diff'
alias gitp='git push'
alias gitpp='git pull'
alias gits='git status'

alias kubectl="minikube kubectl --"

alias l='ls --color'
alias ls='ls --color'
alias lsa='ls --color -a'
alias ll='ls --color -l'
alias lla='ls --color -la'
alias llh='ls --color -lh'
alias llah='ls --color -lah'

alias n='nnn -diUxe'

alias ssh='s'
alias su='us'

alias v=vim
alias vi=vim

alias xterm=$TERMINAL

