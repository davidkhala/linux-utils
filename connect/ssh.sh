#!/usr/bin/env bash
set -e
password-login() {
    # Prerequisite: you need to install util `sshpass` in advance
    # set $password as ssh password
    sshpass -p $password ssh $@
}

authorize-key() {
    mkdir -p ~/.ssh
    local file=~/.ssh/authorized_keys
    touch $file

    if ! grep --quiet "$1" $file; then
        echo $1 | sudo tee -a $file
    fi
}

clean() {
    # clean known_hosts cache
    rm ~/.ssh/known_hosts
}

skip-host-strict() {
    set +e
    ssh -o StrictHostKeyChecking=no $1
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
