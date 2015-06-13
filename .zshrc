# Extend my $PATH to $PATH/bin
export PATH=$PATH:$HOME/bin

# Now source some stuff that should not be public
if [ -e ~/.zshprivate ]
then
source ~/.zshprivate
fi

# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

export EDITOR=vim

# Some aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias l='ls --color'
alias ls='ls --color'
alias lsa='ls -a --color'
alias ll='ls --color -l'
alias lla='ls -la --color'
alias lsd='ls -ld --color'
alias xterm='uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange'

# Set up the Zsh
setopt extendedhistory
setopt histignoredups
setopt histreduceblanks
setopt incappendhistory
setopt sharehistory

# Set up the prompt
autoload -Uz promptinit
promptinit

prompt_gentoo_setup () {
prompt_gentoo_prompt=${1:-'blue'}
prompt_gentoo_user=${2:-'green'}
prompt_gentoo_root=${3:-'red'}

if [ "$USER" = 'root' ]
then
base_prompt="%B%F{$prompt_gentoo_root}%m%k "
else
base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
fi
post_prompt="%b%f%k"
#setopt noxtrace localoptions
path_prompt="%B%F{$prompt_gentoo_prompt}%1~"
PS1="$base_prompt$path_prompt %# $post_prompt"
PS2="$base_prompt$path_prompt %_> $post_prompt"
PS3="$base_prompt$path_prompt ?# $post_prompt"
}
prompt_gentoo_setup "$@"

# Completion stuff
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# I use xterm and this sets a nice title with hostname and cwd in it.
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
