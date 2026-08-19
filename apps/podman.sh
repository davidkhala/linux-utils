install-compose(){
    curl -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/main/podman_compose.py
    chmod +x /usr/local/bin/podman-compose

}
$@
