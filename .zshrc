# Source some global/public stuff.
source ~/.env

# Load Oh-my-Zsh.
source ~/.zsh/oh-my-zsh.sh

# I use xterm and this sets a nice title with hostname and cwd in it.
case $TERM in
    linux*)
        export TERM=linux
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    xterm*)
        export TERM=xterm-256color
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
    screen*)
        export TERM=screen-256color
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Source some functions
for function in ~/.zsh/functions.d/*.sh; do
    source $function
done

home up

# Update tmux window title to the current running command.
if [ -n "$TMUX" ]; then
  function preexec() {
    local cmd=${1[(wr)^(*=*|sudo|su|command)]}
    print -Pn "\e]2;${cmd%% *}\a"
  }
  function precmd() {
    print -Pn "\e]2;zsh\a"
  }
fi

# Source some private stuff or custom things that are different on my systems.
# This file is not in the Git repository!
# Everything in this file overrides configuration settings already loaded.
source ~/.penv

