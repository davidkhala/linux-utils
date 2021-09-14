#!/usr/bin/env bash

reset() {
    sudo passwd $USER
}

$@
