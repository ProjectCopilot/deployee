#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTSDIR=$BASEDIR/scripts

usage() {
    echo "Usage: $0 [-p]"
}

while getopts "ph" o; do
    case "$o" in 
        p) SKIP_IP=true
           ;;
        h) usage 
           exit
           ;;
   esac
done

echo "Downloading components."
$SCRIPTSDIR/setup_components.sh

echo "Installing Python dependencies and creating virtual environment."
$SCRIPTSDIR/setup_python.sh

if [ $SKIP_IP ]; then
    echo "Skipping IP setup. Run scripts/setup_ip_tables.sh if you change your mind."
else
    echo "Setting up IP configurations. You may be asked for an admin password."
    sudo $SCRIPTSDIR/setup_ip_tables.sh
fi

echo "Configuring your settings."
$SCRIPTSDIR/setup_settings.sh

