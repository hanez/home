# Source some global/public stuff.
source ~/.env

# Disable Oh My Zsh auto-title; custom title handling is defined below.
DISABLE_AUTO_TITLE="true"

# Load Oh-my-Zsh.
source ~/.zsh/oh-my-zsh.sh

# I use xterm and this sets a nice title with hostname and cwd in it.
case $TERM in
    linux*)
        export TERM=linux
        _hanez_precmd_title() { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
    xterm*)
        export TERM=xterm-256color
        _hanez_precmd_title() { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
    screen*)
        export TERM=screen-256color
        _hanez_precmd_title() { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
esac

if (( ${+functions[_hanez_precmd_title]} )); then
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _hanez_precmd_title
fi

# Source some functions
for function in ~/.zsh/functions.d/*.sh; do
    source $function
done

home up

# Update tmux window title to the current running command.
if [ -n "$TMUX" ]; then
  autoload -Uz add-zsh-hook
  function _hanez_tmux_preexec() {
    local cmd=${1[(wr)^(*=*|sudo|su|command)]}
    print -Pn "\e]2;${cmd%% *}\a"
  }
  function _hanez_tmux_precmd() {
    print -Pn "\e]2;zsh\a"
  }
  add-zsh-hook preexec _hanez_tmux_preexec
  add-zsh-hook precmd _hanez_tmux_precmd
fi

# Source some private stuff or custom things that are different on my 
# systems. This file is not in the Git repository! Everything in this 
# file overrides configuration settings already loaded. Stuff configured 
# in this file must not be required in any of the above configuration
# and scripts.
source ~/.penv

export PATH="$HOME/.local/bin:$PATH"
