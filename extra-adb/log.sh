#!/bin/bash
# LOG - get logs from android device
# $ log <type> [<args>...]

# prepare
dp0=$(dirname "$0")

# get logs
c="$1" && shift
${dp0}/log/${c}.sh "$@"
