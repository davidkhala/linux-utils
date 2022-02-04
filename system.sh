#!/usr/bin/env bash

viewDiskVolumes() {
	lsblk
}

viewFileSystem() {
	df -h
}
viewRelease() {
	# Reference: https://www.binarytides.com/linux-command-to-check-distro/
	cat /etc/*-release | uniq -u
}
command_exists() {
	command -v "$@" >/dev/null 2>&1
}
get_distribution() {
	lsb_dist=""
	# Every system that we officially support has /etc/os-release
	if [ -r /etc/os-release ]; then
		lsb_dist="$(. /etc/os-release && echo "$ID")"
	fi
	# Returning an empty string here should be alright since the
	# case statements don't act unless you provide an actual value
	echo "$lsb_dist"
}

$@
