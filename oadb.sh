#!/bin/bash
# OADB - control android device
# $ oadb [<command>] [<args>...]

# prepare
dp0=$(dirname "$0")
if [[ "${ANDROID_SERIAL}" == "" ]]; then s=""; else s="-s"; fi
${dp0}/adb/devices.sh ${s}

# run command
if [[ "$1" != "" && "$1" != "devices" ]]; then
  c="$1" && shift
  ${dp0}/adb/${c}.sh "$@"
  echo
fi
