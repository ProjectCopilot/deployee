#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG=$BASEDIR/settings.cfg

echo "What is your GitHub webhook secret?"
read HUB_SECRET
echo "What hostname do you want to run the listener on?"
read HOST
echo "What port do you want to run the listener on?"
read PORT

cat <<EOF > $CONFIG
HUB_SECRET='$HUB_SECRET'
HOST='$HOST'
PORT=$PORT
EOF

