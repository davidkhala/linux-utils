set -e
daemonConfig=/etc/docker/daemon.json
expose() {
    # overwrite with new service ExecStart
    sudo curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/apps/docker/docker.conf --create-dirs -o /etc/systemd/system/docker.service.d/docker.conf
    # add hosts to daemon config file
    if [ ! -f $daemonConfig ]; then
        sudo touch $daemonConfig
    fi
    cat $daemonConfig | jq '.hosts=["unix:///var/run/docker.sock","tcp://127.0.0.1:2375"]' | sudo tee $daemonConfig

    # restart service
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    # Test
    docker -H tcp://127.0.0.1:2375 ps
}

"$@"
