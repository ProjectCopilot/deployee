#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

python $BASEDIR/scripts/list_components.py | while read -r p; do
    echo "Starting $p..."
    $BASEDIR/scripts/refresh.sh -gq $p
done

echo "Started all components."

