#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..
COMPDIR=$BASEDIR/components

rm -rf $COMPDIR
mkdir $COMPDIR
cd $COMPDIR

while read p; do
    git clone $p
done <$BASEDIR/data/projects.csv

rm -rf $BASEDIR/venv
virtualenv $BASEDIR/venv
source $BASEDIR/venv/bin/activate
pip install -r $BASEDIR/data/requirements.txt
deactivate

echo "Setting up IP configurations. You may be asked for an admin password."
sudo $BASEDIR/scripts/setup_ip_tables.sh

echo "Configuring your settings."
$BASEDIR/scripts/configure.sh

