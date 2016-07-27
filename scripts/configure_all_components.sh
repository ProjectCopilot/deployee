#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

for component in $BASEDIR/components/*/; do
    echo "Configuring $(basename $component):"
    $component/configure.sh
    echo
done

