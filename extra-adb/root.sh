#!/bin/bash
# ROOT - set adb in root mode for android device
# $ root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]

# f: root device
function froot {
  adb wait-for-device && adb root
  if [[ "$1" == *"v"* ]]; then adb disable-verity && adb reboot && adb wait-for-device && adb root; fi
  if [[ "$1" == *"r"* ]]; then adb remount && adb wait-for-device; fi
  if [[ "$1" == *"s"* ]]; then adb shell su 0 setenforce 0; fi
}

# prepare
j=""
if [[ "$1" == "" ]]; then
  froot "rs"
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
froot "${j}"
