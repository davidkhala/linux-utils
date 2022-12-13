#!/usr/bin/env bash

reset() {
    sudo passwd $1
}

$@
