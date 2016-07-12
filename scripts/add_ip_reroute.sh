#!/bin/bash
set -eo pipefail

if ! iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port ${1}; then
    echo "Are you root?"
fi
