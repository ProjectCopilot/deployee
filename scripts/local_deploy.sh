#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

export DEPLOYEE_SETTINGS=$BASEDIR/settings.cfg
source $BASEDIR/venv/bin/activate
python $BASEDIR/listener.py

