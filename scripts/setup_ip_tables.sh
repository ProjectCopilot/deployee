#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

cp $BASEDIR/data/iptables.conf /etc/iptables/rules.v4
echo "Make sure iptables-persistent is installed."

