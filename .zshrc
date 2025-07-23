# Source some global/public stuff.
source ~/.env

# Source some private stuff or custom things that are different on my systems.
# This file is not in the Git repository!
source ~/.penv

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

# Obsolete?
#if [ -f /usr/bin/shellpic ]; then
#    if [ -f ~/images/tux.png ]; then
#        /usr/bin/shellpic --shell24 --scale-x 50 ~/images/tux.png
#    fi
#fi

# Obsolete?
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source some functions
for function in ~/.zsh/functions.d/*.sh; do
    source $function
done

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

