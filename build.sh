#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTSDIR=$BASEDIR/scripts

usage() {
    echo "Usage: $0 [-p]"
}

while getopts "cph" o; do
    case "$o" in 
        c) CONFIGURE=true
           ;;
        p) SETUP_IP=true
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

if [ $SETUP_IP ]; then
    echo "Setting up IP configurations. You may be asked for an admin password."
    sudo $SCRIPTSDIR/setup_ip_tables.sh
else
    echo "Skipping IP setup. Run scripts/setup_ip_tables.sh if you change your mind."
fi

echo "Installing Git hooks."
$SCRIPTSDIR/setup_hooks.sh

if [ $CONFIGURE ]; then
    echo "Configuring your settings."
    $SCRIPTSDIR/setup_settings.sh
elif [ ! -f $BASEDIR/settings.cfg ]; then
    echo "Skipping configuration, but settings.cfg is missing. Run configure.sh to write it."
else
    echo "settings.cfg exists. Run configure.sh to rewrite it."
fi

