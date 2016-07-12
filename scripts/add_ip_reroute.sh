#!/bin/bash
set -eo pipefail

iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port ${1}

