#!/bin/bash
# TRACE_PIPE - get trace event logs from android device
# $ trace_pipe [--out|-o <file>]

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
  adb shell "echo > /d/tracing/trace_pipe"
  while true; do
    adb shell "cat /d/tracing/trace_pipe" | tee -a "${f}"
  done
}

# prepare
f="trace_pipe.log"
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
