#!/bin/bash
# SHELL - run shell commands on android device
# $ shell [<command>] [<args>...]

# prepare
dp0=$(dirname "$0")

# run command
if [[ "$1" == "" ]]; then
  ${dp0}/root.sh && adb shell
  exit 0
fi
c="$1" && shift
${dp0}/shell/${c}.sh "$@"
