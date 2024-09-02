tmx () {
    # Use -d to allow the rest of the function to run
    tmux new-session -d -s "CMD"
    tmux new-window
    # -d to prevent current window from changing
    #tmux new-window -d
    #tmux new-window -d
    #tmux new-window -d
    #tmux new-window -d
    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
    tmux attach-session -d -t "CMD"
}

