#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux kill-session -t "deployee" &>/dev/null || true
tmux new -s deployee -d
tmux send -t deployee "TMUX=0" ENTER
tmux send -t deployee "bash $BASEDIR/scripts/local_deploy.sh" ENTER
