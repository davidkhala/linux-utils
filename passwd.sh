#!/usr/bin/env bash

reset() {
    sudo passwd $USER
}
resetWith(){
    echo -e $1 | sudo passwd $USER
}
$@
