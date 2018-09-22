#!/bin/bash
# WAIT-FOR-DEVICE - wait for android device to be in adb mode
# $ wait-for-device

# prepare
s="" && f="0"
if [[ "${ANDROID_SERIAL}" != "" ]]; then s="-s"; fi

# if in fastboot, switch to adb mode, wait
${dp0}/devices.sh ${s} | while read -a a; do
  if [[ "${a[1]}" == "fastboot" ]]; then f="1"; fi
done
if [[ "${f}" == "1" ]]; then fastboot continue; fi
adb wait-for-device
