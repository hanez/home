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
            git pull
            git submodule update --init --recursive
            ;;
        *)
            echo "command not found!"
            echo ""
            _home_help
            ;;
    esac
}
