# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -r $HOME/.zsh_functions.zsh ]]; then
      source $HOME/.zsh_functions.zsh
fi

# Extend my $PATH to $HOME/bin
export PATH=$HOME/bin:$HOME/.local/bin/:$HOME/.gem/ruby/3.0.0/bin:$HOME/.android/sdk/platform-tools:$PATH

# Private stuff 
source ~/.zsh_private

# Java Stuff
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Android / Kivy Development Stuff
export ANDROID_HOME=/home/hanez/.android/sdk
export ANDROIDSDK="/home/hanez/.android/sdk"
export ANDROID_SDK_ROOT="/home/hanez/.android/sdk"
#export ANDROIDNDK="/opt/android-ndk"
#export ANDROIDAPI="27"
#export ANDROIDNDKVER="r16b"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable


# Export the $EDITOR and $TERMINAL
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim
export TERMINAL='/usr/bin/uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange -fa "NotoMono Nerd Font Mono" -fs 13'

# Fix to make JAVA applications behave more friendly in awesome. Still many JAVA apps
# suck in awesome. PyCharm works perfect, Arduino does not!
export _JAVA_AWT_WM_NONREPARENTING=1

export XDG_RUNTIME_DIR=/run/user/1000

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
plugins=(colored-man-pages)

# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
# export MANPATH="/usr/local/man:$MANPATH"

# Load oh-my-zsh stuff
source $ZSH/oh-my-zsh.sh

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
alias c='clear'
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
alias vi=vim
alias y=yaourt
alias xterm=$TERMINAL
#alias backup_t410='rsync -avr --delete --delete-excluded --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/run / /run/media/hanez/BACKUP1000GB/t410/'
#alias backup_11s='rsync -avr --delete --delete-excluded --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/run / /run/media/hanez/BACKUP1000GB/11s/'
#alias spamup='rsync -avr --delete ~/.bogofilter/* b.systemchaos.org:/var/bogofilter'
#alias x5musicsync="adb-sync --delete /home/hanez/music/* /sdcard/Music"

# Some Git aliases
alias gita='git add'
alias gitc='git commit'
alias gitd='git diff'
alias gitp='git push'
alias gitpp='git pull'
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

if [ -f /usr/bin/shellpic ]; then 
    if [ -f ~/images/tux.png ]; then
        /usr/bin/shellpic --shell24 --scale-x 50 ~/images/tux.png
    fi
fi

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
