#!/bin/bash
# SCREENCAP - get screen capture from android device
# $ screencap [--out|-o <file>]

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

# f: get screen capture
function fget {
  adb shell "screencap -p /sdcard/${f}"
  adb pull "/sdcard/${f}" .
  adb shell "rm /sdcard/${f}"
}

# prepare
f="screencap.png"
if [[ "$1" == "" ]]; then
  fuse && fget
  exit 0
fi

# options
while [[ "$1" != "" ]]; do
  i="$1" && shift
  if [[ "${i:0:2}" == "--" ]]; then
    fuse "${i:2:1}" "$@"
  elif [[ "${i:0:1}" == "--" ]]; then
    fuse "${i:1}" "$@"
  fi
  shift $?
done
fget
