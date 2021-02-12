#!/usr/bin/env bash

viewDiskVolumes() {
    lsblk
}

viewFileSystem() {
    df -h
}
viewRelease(){
    # Reference: https://www.binarytides.com/linux-command-to-check-distro/
    cat /etc/*-release | uniq -u
}
$@
