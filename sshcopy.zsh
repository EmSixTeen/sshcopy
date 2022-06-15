## Copy public SSH key
function sshcopy() {
    # Copy the SSH key
    # Location didnt work when in quotes
    local keyLocation="$HOME/.ssh/id_rsa.pub"
    local configLocation="$HOME/.ssh/config"

    # Set up colours
    local Black='\033[0;30m'        # Black
    local Red='\033[0;31m'          # Red
    local Green='\033[0;32m'        # Green
    local Yellow='\033[0;33m'       # Yellow
    local Blue='\033[0;34m'         # Blue
    local Purple='\033[0;35m'       # Purple
    local Cyan='\033[0;36m'         # Cyan
    local White='\033[0;37m'        # White
    local NC='\033[0m'              # No Color

    local arrow="${Cyan}->${NC}"
    local arrowError="${Red}->${NC}"
    local arrowSuccess="${Green}->${NC}"
    local arrowWarning="${Yellow}->${NC}"

    local showClipboard=false

    while [ $# -gt 0 ]; do
        case "$1" in
            -s | -e | --show | --echo )
                showClipboard=true
                ;;
            * )
                printf "$arrowError ${Red}Error:${NC} Unknown option: $1\n"
        esac
        shift
    done
    
    echo ""

    if [ ! -f "$keyLocation" ]; then

        echo "$arrowError ${Red}Error:${NC} That file doesn't seem to exist"
        echo "   ($keyLocation)"

    elif [ -f "$keyLocation" ]; then
    
        echo "$arrowSuccess File exists, copying it to clipboard"
        pbcopy < "$keyLocation"

        if [[ $showClipboard == true ]]; then
            echo "$arrow Parameter passed to show clipboard contents:"
            echo ""
            echo `pbpaste`   
            echo ""
        fi

        if [ ! -f "$configLocation" ]; then
            echo "$arrowWarning You don't seem to have an SSH config file - Maybe set one up?"
            echo "   ($configLocation)"
        elif [ -f "$configLocation" ]; then
            echo "$arrow Don't forget you can add an alias to your SSH config to easily access"
            echo "   the site via SSH ($configLocation)"
        fi

    fi

    echo ""
}