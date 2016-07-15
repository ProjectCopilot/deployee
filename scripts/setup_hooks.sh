#!/bin/bash
set -eo pipefail

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/..

ln -s -f ../../hooks/* $BASEDIR/.git/hooks/

