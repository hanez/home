us() {
  if [ -n "$TMUX" ]; then
    local original_name
    original_name=$(tmux display-message -p '#W')

    # Determine the target username
    local target_user="root"
    local arg1="$1"
    if [[ "$arg1" != "-" && -n "$arg1" ]]; then
      target_user="$arg1"
    fi

    # Rename the window before running su
    tmux rename-window "su-${target_user}"

    # Use "command su" to bypass the function if it exists
    command su "$@"

    # Restore original window name after exit
    tmux rename-window "$original_name"
  else
    command su "$@"
  fi
}

