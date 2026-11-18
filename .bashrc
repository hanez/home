# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/hanez/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Some murx magic
if [[ $- == *i* && ( -n $SSH_CONNECTION || $TERM == screen-256color ) &&
      -z ${murx_ssh_installed-} ]]; then
    murx_ssh_title() {
        local program=$1 directory=$PWD
        program=${program##*/}
        printf '\033]2;%s:%s\007' "${HOSTNAME%%.*}" "$program"
        if [[ $directory == "$HOME" ]]; then
            directory='~'
        elif [[ $directory == "$HOME/"* ]]; then
            directory="~/${directory#"$HOME/"}"
        fi
        printf '\033]777;murx-cwd;%s\007' "$directory"
        printf '\033]777;murx-root;%s\007' "$((EUID == 0))"
    }
    murx_ssh_preexec() {
        if [[ ${murx_ssh_ready-0} == 1 && $1 != murx_ssh_precmd ]]; then
            murx_ssh_ready=0
            local program rest
            read -r program rest <<< "$1"
            # Strip quotes around a simple command name without evaluating it.
            program=${program#\"}; program=${program%\"}
            program=${program#\'}; program=${program%\'}
            murx_ssh_title "$program"
        fi
        return 0
    }
    murx_ssh_precmd() {
        local last_status=$?
        murx_ssh_title bash
        murx_ssh_ready=1
        return "$last_status"
    }
    # Keep existing prompt commands, and run our prompt hook last.
    if [[ $(declare -p PROMPT_COMMAND 2>/dev/null) == 'declare -a '* ]]; then
        PROMPT_COMMAND+=(murx_ssh_precmd)
    else
        PROMPT_COMMAND=("${PROMPT_COMMAND-}" murx_ssh_precmd)
    fi
    trap 'murx_ssh_preexec "$BASH_COMMAND"' DEBUG
    murx_ssh_installed=1
fi

