#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check that the settings exist
if [ ! -f $BASEDIR/settings.cfg ]; then
    echo "Write your settings.cfg!"
    exit 1
fi

tmux kill-session -t "deployee" &>/dev/null || true
tmux new -s deployee -d
tmux send -t deployee "TMUX=0" ENTER
tmux send -t deployee "bash $BASEDIR/scripts/local_deploy.sh" ENTER

$BASEDIR/scripts/cycle_components.sh

