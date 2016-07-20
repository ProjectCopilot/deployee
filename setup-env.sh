# Run this in terminal with source setup-env.sh

if [[ "$(basename -- "$0")" == "setup-env.sh" ]]; then
    echo "Don't run $0, source it (see README.md)" >&2
fi

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias refresh="$BASEDIR/scripts/refresh.sh"
alias cycle="$BASEDIR/scripts/cycle_components.sh"

