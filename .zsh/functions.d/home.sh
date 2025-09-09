function _home_help() {
    echo "Available commands:"
    echo ""
    echo "help:        Show this help text."
    echo "pull:        Execute git pull in $HOME."
    echo "sub:         Update all submodules of $HOME."
    echo "up:          Pull and update submodules in $HOME."
}

function home() {
    case $1 in
        diff)
            cd ~
            git diff
            cd $OLDPWD
            ;;
        help)
            _foo_help
            ;;
        pull)
            cd ~
            git pull
            cd $OLDPWD
            ;;
        status)
            cd ~
            git status
            cd $OLDPWD
            ;;
        sub)
            cd ~
            git submodule update --init --recursive
            cd $OLDPWD
            ;;
        up)
            cd ~
            last_update=$(stat -c %Y .lastupdate)
            echo "Last configuration update: $last_update"
            current_date=$(date +%s)
            echo "Current date: $current_date"
            time_diff=$(($current_date-$last_update))
            echo "Time difference: $time_diff"
            if (( time_diff > 86400 )) || [ "$2" = "f" ]; then
              echo "Doing home up..."
              git pull
              git submodule update --init --recursive
              touch .lastupdate
            else
              echo "/home/hanez was already updated in the last 24 hours."
              echo "Run this to force updating: home up f"
            fi
            cd $OLDPWD
            ;;
        *)
            echo "Command not found!"
            echo ""
            _home_help
            ;;
    esac
}
