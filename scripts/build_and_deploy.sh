#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

echo "Building $1..."
$BASEDIR/components/$1/build.sh

echo "Deploying $1..."
$BASEDIR/components/$1/deploy.sh

