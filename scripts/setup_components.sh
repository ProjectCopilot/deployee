#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..
COMPDIR=$BASEDIR/components

rm -rf $COMPDIR
mkdir $COMPDIR
cd $COMPDIR

while read p; do
    git clone $p
done <$BASEDIR/data/projects.csv

