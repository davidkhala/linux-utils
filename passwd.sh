#!/usr/bin/env bash

reset() {
    sudo passwd $USER
}
resetWith(){
    usermod -p $1 $USER
}
$@
