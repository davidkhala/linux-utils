#!/usr/bin/env bash
set -e
decode() {
  openssl x509 -in "$1" -text -noout
}
$@
