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
echo "Debug? (\"True\" or \"False\")"
read DEBUG
echo "Where is your SSL certificate? (\"None\" if debug)"
read SSL_CERT
echo "Where is your SSL private key? (\"None\" if debug)"
read SSL_KEY

cat <<EOF > $CONFIG
HUB_SECRET = '$HUB_SECRET'
HOST = '$HOST'
PORT = $PORT
DEBUG = $DEBUG
SSL_CERT = '$SSL_CERT'
SSL_KEY = '$SSL_KEY'
EOF

