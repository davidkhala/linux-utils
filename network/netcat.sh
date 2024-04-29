# TODO powerful than nmap
# Reference: https://blog.gtwang.org/linux/linux-utility-netcat-examples/
# $ nc - arbitrary TCP and UDP connections and listens

probe() {
  local host=$1
  local port=$2
  nc -v $host $port
}
serve() {
  local port=$1
  local pongContent=$2
  if [ -z $pongContent ];then
    pongContent=$(date)
  fi
  echo -e "HTTP/1.1 200 OK\n\n ${pongContent}" | nc -l -p $port
}
$@
