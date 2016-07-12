#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..
TMPLIST=/tmp/deployee_component_list.csv

# Yes, yes, I know. How about you figure out string manipulation in bash? 
python $BASEDIR/scripts/list_components.py $TMPLIST

while read p; do
    echo "Starting $p..."
    $BASEDIR/scripts/refresh.sh -gq $p
done <$TMPLIST

echo "Started all components."

