#!/usr/bin/env bash
set -e

authorize-key(){
    # TODO
    ~/.ssh/authorized_keys    
}


skipHostStrict(){
    local _host=${1:-git@github.com}
    set +e
    ssh -o StrictHostKeyChecking=no ${_host}
    set -e
}
genRSA() {
    local keySize
    local email
    local rsaKeyPrv
    local inline=$1
    if [ -z "$inline" ]; then
        read -p "enter email (default:david-khala@hotmail.com):" email
        read -p "enter keySize (default:4096) :" keySize
    fi
    keySize=${keySize:-4096}
    email=${email:-"david-khala@hotmail.com"}
    ssh-keygen -t rsa -b $keySize -C $email
    eval "$(ssh-agent -s)"

    if [ -z "$inline" ]; then
        read -p "Enter key file path again ($HOME/.ssh/id_rsa):" rsaKeyPrv
    fi
    rsaKeyPrv=${rsaKeyPrv:-"$HOME/.ssh/id_rsa"}
    ssh-add $rsaKeyPrv
}

$@
