#!/usr/bin/env bash
symbolic-link() {
    local targetSrc=$1
    local link=$2
    sudo ln -s $1 $2
}
untar() {
    tar -xf $1
}
find() {
    # mlocate: global find
    sudo updatedb
    locate $1
}
$@
