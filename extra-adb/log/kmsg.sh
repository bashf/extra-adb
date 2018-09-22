#!/bin/bash
# KMSG - get kernel message log from android device
# $ kmsg [--out|-o <file>]

# f: use options
function fuse {
  j="$1" && shift && n=$#
  while [[ "${j}" != "" ]]; do
    k="${j:0:1}"
    if [[ "${k}" == "o" ]]; then f="$1" && shift; fi
    j="${j:1}"
  done
  return $(($n-$#))
}

# f: collect logs
function flog {
  > "${f}"
  adb shell "echo > /proc/kmsg"
  while true; do
    adb shell "cat /proc/kmsg" | tee -a "${f}"
  done
}

# prepare
f="kmsg.log"
if [[ "$1" == "" ]]; then
  fuse && flog
  exit 0
fi

# options
while [[ "$1" != "" ]]; do
  i="$1" && shift
  if [[ "${i:0:2}" == "--" ]]; then
    fuse "${i:2:1}" "$@"
  elif [[ "${i:0:1}" == "-" ]]; then
    fuse "${i:1}" "$@"
  fi
  shift $?
done
flog
