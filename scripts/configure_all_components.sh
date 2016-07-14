#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..
TMPLIST=/tmp/deployee_component_list.csv

python $BASEDIR/scripts/list_components.py $TMPLIST

while read p; do
    echo "Now configuring $p."
    $BASEDIR/scripts/configure_component.sh $p
done <$TMPLIST

