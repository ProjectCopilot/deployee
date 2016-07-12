#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

$BASEDIR/scripts/clear_ip_reroutes.sh 80
$BASEDIR/scripts/add_ip_reroute $1

