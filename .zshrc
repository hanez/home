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

# Extend my $PATH to $PATH/bin
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:$PATH:$HOME/bin

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

# I use xterm and this sets a nice title with hostname and cwd in it.
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

