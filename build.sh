#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTSDIR=$BASEDIR/scripts

echo "Downloading components."
$SCRIPTSDIR/setup_components.sh

echo "Installing Python dependencies and creating virtual environment."
$SCRIPTSDIR/setup_python.sh

echo "Setting up IP configurations. You may be asked for an admin password."
sudo $SCRIPTSDIR/setup_ip_tables.sh

echo "Configuring your settings."
$SCRIPTSDIR/setup_settings.sh

