#!/bin/bash
# CAT - get logcat from android device
# $ cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]

# f: use options
function fuse {
  j="$1" && shift && n=$#
  while [[ "${j}" != "" ]]; do
    k="${j:0:1}"
    if [[ "${k}" == "k" ]]; then z="${z} -b kernel"; fi
    if [[ "${k}" == "c" ]]; then z="${z} -b crash"; fi
    if [[ "${k}" == "m" ]]; then z="${z} -b main"; fi
    if [[ "${k}" == "t" ]]; then z="${z} -v threadtime"; fi
    if [[ "${k}" == "o" ]]; then f="$1" && shift; fi
    j="${j:1}"
  done
  return $(($n-$#))
}

# f: collect logs
function flog {
  > "${f}"
  while true; do
    adb logcat ${z} -c
    adb logcat ${z} | tee -a "${f}"
  done
}

# prepare
z="" && f="logcat.log"
if [[ "$1" == "" ]]; then
  fuse "kcmt" && flog
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
