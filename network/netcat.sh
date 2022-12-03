# TODO powerful than nmap
# Reference: https://blog.gtwang.org/linux/linux-utility-netcat-examples/
# $ nc - arbitrary TCP and UDP connections and listens

probe() {
  local host=$1
  local port=$2
  nc -v $host $port
}
$@
