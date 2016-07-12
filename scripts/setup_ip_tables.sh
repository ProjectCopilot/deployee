#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

if ! cp $BASEDIR/data/iptables.conf /etc/iptables/rules.v4; then
    echo "Install iptables_persist and retry setup_ip_tables.sh"
fi

