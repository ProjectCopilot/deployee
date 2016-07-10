#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

if [[ $# -eq 0 ]] ; then
    echo "Which component do you want to deploy?"
    exit 1
fi

cd $BASEDIR/components/"$1"
git pull origin master

# Refresh background process"
tmux kill-session -t "$1" &>/dev/null || true
tmux new -s "$1" -d
tmux send -t "$1" "bash deploy.sh &>$(tty)" ENTER
sleep 1 # Wait for response

