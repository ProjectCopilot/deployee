#!/bin/bash
set -eo pipefail

iptables-save | grep "\-\-dport $1" | cut -d " " -f2- | while read -r line ; do
    iptables -t nat -D $line
done

