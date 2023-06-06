 uri=$1
 shift 1
 curl -sSL $uri | sudo bash -s -- $@
