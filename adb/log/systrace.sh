#!/bin/bash
# SYSTRACE - get systrace from android device
# $ systrace [--time|-t <time>] [--out|-o <file>]

# f: use options
function fuse {
  j="$1" && shift && n=$#
  while [[ "${j}" != "" ]]; do
    k="${j:0:1}"
    if [[ "${k}" == "t" ]]; then t="$1" && shift; fi
    if [[ "${k}" == "o" ]]; then f="$1" && shift; fi
    j="${j:1}"
  done
  return $(($n-$#))
}

# f: collect systrace
function flog {
  if [[ "${ANDROID_HOME}" == "" ]]; then
    echo "systrace: ANDROID_HOME variable not defined" >2
    exit 0
  fi
  p="${ANDROID_HOME}/platform-tools/systrace"
  python "${p}/systrace.py" --time=${t} -o "${f}" sched gfx view wm
}

# prepare
t="30" && f="systrace.html"
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
