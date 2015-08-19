# Extend my $PATH to $PATH/bin
export PATH=$HOME/bin:/home/hanez/.gem/ruby/2.2.0/bin:$PATH

# Export the $EDITOR and $TERMINAL
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim
export TERMINAL="/usr/bin/uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange"

# Fix to make JAVA applications behave more friendly in awesome. Still many JAVA apps
# suck in awesome. PyCharm works perfect, Arduino does not!
export _JAVA_AWT_WM_NONREPARENTING=1

# Path to your oh-my-zsh installation.
export ZSH=~/.zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hanez"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man)

# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
# export MANPATH="/usr/local/man:$MANPATH"

# Load oh-my-zsh stuff
source $ZSH/oh-my-zsh.sh

# Stuff thats needs to be done after sourcing oh-my-zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
if [ -e ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Now source some stuff that should not be public
if [ -e ~/.zshprivate ]
then
    source ~/.zshprivate
fi

# Source some functions
for function in ~/.zsh/functions.d/*.sh; do
    source $function
done

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
alias llh='ls -lh --color'
alias llah='ls -lah --color'
alias lsd='ls -ld --color'
alias vi=vim
alias xterm=$TERMINAL
alias backup_t410='rsync -avr --delete --delete-excluded --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/run / /run/media/hanez/BACKUP1000GB/t410/'
alias backup_11s='rsync -avr --delete --delete-excluded --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/run / /run/media/hanez/BACKUP1000GB/11s/'

# Some Git aliases
alias gitc='git commit'
alias gitd='git diff'
alias gitp='git push'
alias gits='git status'

# I use xterm and this sets a nice title with hostname and cwd in it.
case $TERM in
    linux)
        export TERM=linux-16color
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    xterm*)
        export TERM=xterm-256color
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    screen)
        export TERM=screen-256color
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

