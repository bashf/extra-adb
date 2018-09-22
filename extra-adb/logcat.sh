#!/bin/bash
# LOGCAT - get logcat from android device
# $ logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]

# prepare
dp0=$(dirname "$0")

# get logs
${dp0}/log/cat.sh "$@"
