#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

usage() {
    echo "Usage: $0 [-gq] <component>"
}

if [[ $# -eq 0 ]]; then
    usage
    exit 127
fi

# Check for flag
OPTIND=1
while getopts "gqh" o; do # set $o to the next passed option
    case "$o" in 
        g) SKIP_GIT=true
           ;;
        v) VERBOSE=true
           ;;
        h) usage
           exit
           ;;
  esac
done

# Shift to the first legit argument
shift $(($OPTIND - 1))

if [ ! $SKIP_GIT ]; then
    cd $BASEDIR/components/"$1"
    git pull origin master
fi

# Refresh background process"
tmux kill-session -t "$1" &>/dev/null || true
tmux new -s "$1" -d
if [ $VERBOSE ]; then
    tmux send -t "$1" "$BASEDIR/scripts/build_and_deploy.sh $1 2>$(tty)" ENTER
else
    tmux send -t "$1" "$BASEDIR/scripts/build_and_deploy.sh $1" ENTER
fi
sleep 1 # Wait for response

