function _home_date() {
  os_name=$(uname)
  if [ "$os_name" = "FreeBSD"  ]; then
    hdate=$(date -r $1)
  else
    hdate=$(date -d @$1)
  fi
  return $hdate
}

function _home_help() {
    echo "Available commands:"
    echo ""
    echo "help:        Show this help text."
    echo "diff         Show the file differences."
    echo "pull:        Execute git pull in $HOME."
    echo "sub:         Update all submodules of $HOME."
    echo "status       Show Git status."
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
            _home_help
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
            if test -f .lastupdate; then
              last_update=$(stat -c %Y .lastupdate)
              echo "Last configuration update: $last_update"
              current_date=$(date +%s)
              echo "Current date: _home_date $current_date"
              time_diff=$(($current_date-$last_update))
              echo "Time difference: $time_diff seconds."
              if (( time_diff > 86400 )) || [ "$2" = "f" ]; then
                echo "Updating home configuration..."
                if git pull; then
                  if git submodule update --init --recursive; then
                    touch .lastupdate
                  fi
                fi
              else
                echo "/home/hanez was already updated in the last 24 hours."
                echo "Run this to force updating: home up f"
              fi
            else
              echo "~/.lastupdate does not exist!"
              echo "You need to run the following command to update your"
              echo "home configuration: home up f"
              touch .lastupdate
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
