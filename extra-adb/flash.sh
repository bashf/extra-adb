#!/bin/bash
# FLASH - flash build on android device
# $ flash <type> [<args>...]

# prepare
dp0=$(dirname "$0")
${dp0}/wait-for-fastboot.sh

# flash images
c="$1" && shift
${dp0}/flash/${c}.sh "$@"
fastboot continue
