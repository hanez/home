function _home_help() {
    echo "available commands:"
    echo ""
    echo "help:        show this help text"
    echo "pull:        execute git pull in $HOME"
    echo "sub:         update all submodules of $HOME"
    echo "up:          pull and update submodules in $HOME"
}

function home() {
    case $1 in
        diff)
            cd ~
            git diff
            ;;
        help)
            _home_help
            ;;
        pull)
            cd ~
            git pull
            ;;
        status)
            cd ~
            git status
            ;;
        sub)
            cd ~
            git submodule update --init --recursive
            ;;
        up)
            cd ~
            last_update=$(stat -c %Y .lastupdate)
            current_date=$(date +%s)
            time_diff=$(($current_date-$last_update))
            if (( time_diff > 86400 )); then
              git pull
              git submodule update --init --recursive
            elif
              echo "/home/hanez was already updated in the last 24 hours."
              echo "Run this to force updating: home up f"
              if [ "$2" = "x" ]; then
                git pull
                git submodule update --init --recursive
              fi
            fi
            ;;
        *)
            echo "command not found!"
            echo ""
            _home_help
            ;;
    esac
}
