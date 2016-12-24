#!/bin/bash
# WAIT-FOR-FASTBOOT - wait for android device to be in fastboot mode
# $ wait-for-fastboot

# prepare
s="" && d="0"
if [[ "${ANDROID_SERIAL}" == "" ]]; then s="-s"; fi

# if in fastboot, switch to adb mode, wait
${dp0}/devices.sh ${s} | while read -a a; do
  if [[ "${a[1]}" == "device" ]]; then d="1"; fi
done
if [[ "${d}" == "1" ]]; then adb reboot bootloader; fi
fastboot pragma 1>NUL 2>&1
