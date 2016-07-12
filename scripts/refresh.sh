#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

usage() {
    echo "Usage: $0 [-q] <component>"
}

if [[ $# -eq 0 ]] ; then
    usage
    exit 127
fi

# Check for flag
OPTIND=1
while getopts "qh" o ; do # set $o to the next passed option
  case "$o" in 
    q) QUIET=true 
       ;;
    h) print "$usage"
       exit
       ;;
  esac
done

# Shift to the first legit argument
shift $(($OPTIND - 1))

cd $BASEDIR/components/"$1"
git pull origin master

# Refresh background process"
tmux kill-session -t "$1" &>/dev/null || true
tmux new -s "$1" -d
if [ $QUIET ]; then
    tmux send -t "$1" "bash deploy.sh" ENTER
else
    tmux send -t "$1" "bash deploy.sh 2>$(tty)" ENTER
fi
sleep 1 # Wait for response

