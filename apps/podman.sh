install-compose() {
    case "${1:-system}" in
        user)
            mkdir -p "$HOME/.local/bin"
            curl -fsSL -o "$HOME/.local/bin/podman-compose" https://raw.githubusercontent.com/containers/podman-compose/main/podman_compose.py
            chmod +x "$HOME/.local/bin/podman-compose"
            ;;
        system)
            curl -fsSL -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/main/podman_compose.py
            chmod +x /usr/local/bin/podman-compose
            ;;
    esac
}
