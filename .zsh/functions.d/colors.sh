# This function shows some examples of shell colorizing and the color codes.
# Nothing special... ;)
# I got the commands from:
# http://www.commandlinefu.com/commands/view/5879/show-numerical-values-for-each-of-the-256-colors-in-bash
function colors() {
    case $1 in
        1)
            for x in 0 1 4 5 7 8; do
                for i in `seq 30 37`; do
                    for a in `seq 40 47`; do
                        echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m ";
                    done;
                echo;
                done;
            done;
            echo "";
            ;;
        2)
            for i in {0..255}; do
                echo -e "\e[38;05;${i}m\\\e[38;05;${i}m";
            done | column -c 80 -s '  ';
            echo -e "\e[m"
            ;;
        3)
            for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 80 -s ' '; echo -e "\e[m"
            ;;
        4)
            for code in {0..255}; do echo -en "\e[38;05;${code}m $code"; done
            ;;
        5)
            for line in {0..5}; do
                for col in {0..39}; do
                    code=$(( $col * 6 + $line + 16 ));
                    printf $'\e[38;05;%dm %03d' $code $code;
                done;
                echo;
            done
            ;;
        *)
            echo "command not found!"
            echo ""
            ;;
    esac
}
