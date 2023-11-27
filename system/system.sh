#!/usr/bin/env bash

view-disk-volumes() {
	lsblk
}
view-cpu() {
	lscpu
}
view-memory() {
	free -h
}

view-file-system() {
	df -h
}
view-release() {

	# Reference: https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
	hostnamectl
}
command-exists() {
	command -v "$@" >/dev/null 2>&1
}
get-distribution() {
	lsb_dist=""
	# Every system that we officially support has /etc/os-release
	if [ -r /etc/os-release ]; then
		lsb_dist="$(. /etc/os-release && echo "$ID")"
	fi
	# Returning an empty string here should be alright since the
	# case statements don't act unless you provide an actual value
	echo "$lsb_dist" | tr '[:upper:]' '[:lower:]'

}
get-dist-version() {

	case "$lsb_dist" in

	ubuntu)
		if command_exists lsb_release; then
			dist_version="$(lsb_release --codename | cut -f2)"
		fi
		if [ -z "$dist_version" ] && [ -r /etc/lsb-release ]; then
			dist_version="$(. /etc/lsb-release && echo "$DISTRIB_CODENAME")"
		fi
		;;

	debian | raspbian)
		dist_version="$(sed 's/\/.*//' /etc/debian_version | sed 's/\..*//')"
		case "$dist_version" in
		11)
			dist_version="bullseye"
			;;
		10)
			dist_version="buster"
			;;
		9)
			dist_version="stretch"
			;;
		8)
			dist_version="jessie"
			;;
		esac
		;;

	centos | rhel | sles)
		if [ -z "$dist_version" ] && [ -r /etc/os-release ]; then
			dist_version="$(. /etc/os-release && echo "$VERSION_ID")"
		fi
		;;

	*)
		if command_exists lsb_release; then
			dist_version="$(lsb_release --release | cut -f2)"
		fi
		if [ -z "$dist_version" ] && [ -r /etc/os-release ]; then
			dist_version="$(. /etc/os-release && echo "$VERSION_ID")"
		fi
		;;

	esac
	echo "$dist_version"
}
$@
