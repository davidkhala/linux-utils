#!/usr/bin/env bash

viewDiskVolumes() {
    lsblk
}

viewFileSystem() {
    df -h
}
viewRelease(){
    cat /etc/*-release | uniq -u
}
$@
