#!/bin/bash
# DEVICES - lists connected android devices
# $ devices [--adb|-a] [--fastboot|-f] [--specific|-s]

# f: list devices
function fdev {
  j="$1"
  if [[ "${j}" == *"s"* ]]; then s="1"; fi
  while [[ "${j}" != "" ]]; do
    k="${j:0:1}"
    if [[ "${k}" == "a" ]]; then
      adb devices | tail -n +2 | while read -a a; do
        fecho "${s}" "${a[0]}" "${a[1]}"
      done
    elif [[ "${k}" == "f" ]]; then
      fastboot devices | while read -a a; do
        fecho "${s}" "${a[0]}" "${a[1]}"
      done
    fi
    j="${j:1}"
  done
}

# f: echo device id
function fecho {
  if [[ "$1" == "1" && "$2" == "${ANDROID_SERIAL}" ]]; then echo "$2 $3"; fi
  if [[ "$1" == "0" ]]; then echo "$2 $3"; fi
}

# prepare
j="" && s="0"
if [[ "$1" == "" ]]; then
  fdev "af"
  exit 0
fi

# options
while [[ "$1" != "" ]]; do
  i="$1" && shift
  if [[ "${i:0:2}" == "--" ]]; then
    j="${j}${i:2:1}"
  elif [[ "${i:0:1}" == "-" ]]; then
    j="${j}${i:1}"
  fi
done
fdev "${j}"
