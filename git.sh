#!/usr/bin/env bash
set -e

prepare() {
    email=${email:-"david-khala@hotmail.com"}
    name=${name:-"david liu"}
    git config --global user.email $email
    git config --global user.name $name
}
switch-branch() {
    local branchName=$1
    echo "switching to branch origin/$branchName"
    git checkout -b $branchName
    git fetch
    git branch --set-upstream-to=origin/$branchName $branchName
    git pull
}
rebase-strategy() {
    git config pull.rebase true
}
merge-strategy() {
    git config pull.rebase false
}

$@
