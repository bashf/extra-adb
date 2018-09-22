#!/bin/bash
# ROM - flash rom build images to android device
# $ rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]

# f: flash images
function fflash {
  w="fastboot flash" && j="$1"
  while [[ "${j}" != "" ]]; do
  	k="${j:0:1}"
  	if [[ "${k}" == "s" ]]; then
  		ls *system*.img | while read a; do ${w} system ${a}; done
  		ls *sysfs*.ext4 | while read a; do ${w} system ${a}; done
  	elif [[ "${k}" == "u" ]]; then
  		ls *userdata*.img | while read a; do ${w} userdata ${a}; done
  		ls *usrfs*.ext4 | while read a; do ${w} userdata ${a}; done
  	elif [[ "${k}" == "r" ]]; then
  		ls *recovery*.img | while read a; do ${w} recovery ${a}; done
  		ls *recovery*.ext4 | while read a; do ${w} recovery ${a}; done
  	elif [[ "${k}" == "p" ]]; then
  		ls *persist*.img | while read a; do ${w} persist ${a}; done
  		ls *persist*.ext4 | while read a; do ${w} persist ${a}; done
  	elif [[ "${k}" == "c"]]; then
  		ls *cache*.img | while read a; do ${w} cache ${a}; done
  		ls *cache*.ext4 | while read a; do ${w} cache ${a}; done
  	elif [[ "${k}" == "b" ]]; then
  		ls *boot*.img | while read a; do ${w} boot ${a}; done
  	elif [[ "${k}" == "a" ]]; then
  		ls *appsboot*.mbn | while read a; do ${w} aboot ${a}; done
  	fi
  	j="${j:1}"
  done
}

# prepare
if [[ "$1" == "" ]]; then
  fflash "surpmcba"
  exit 0
fi

# options
for i in "$@"; do
	if [[ "${i:0:2}" == "--" ]]; then
		fflash "${i:2:1}"
	elif [[ "${a:0:1}" == "-" ]]; then
		fflash "${a:1}"
	fi
done
