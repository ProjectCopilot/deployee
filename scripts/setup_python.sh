#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

rm -rf $BASEDIR/venv
virtualenv $BASEDIR/venv
source $BASEDIR/venv/bin/activate
pip install -r $BASEDIR/data/requirements.txt
deactivate

