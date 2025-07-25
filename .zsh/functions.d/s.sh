# SSH with automatic tmux window renaming
s() {
  # Only rename tmux window if inside tmux
  if [ -n "$TMUX" ]; then
    local original_name
    original_name=$(tmux display-message -p '#W')

    # Extract the host from arguments (first arg without user@ or port)
    local ssh_host="$1"
    ssh_host="${ssh_host#*@}"       # remove user@
    ssh_host="${ssh_host%% *}"      # trim after space
    ssh_host="${ssh_host%%:*}"      # remove port if given (e.g. user@host:2222)

    tmux rename-window "${ssh_host%%.*}"  # short hostname

    # Run SSH session
    command ssh "$@"

    # Restore previous tmux window name
    tmux rename-window "$original_name"
  else
    command ssh "$@"
  fi
}

