set -e
config=/etc/docker/daemon.json
rootlessConfig=~/.config/docker/daemon.json
edit-config() {
    sudo vi $config
}
edit-rootless-config() {
    # TODO not tested yet
    sudo vi $rootlessConfig
}
expose-http() { # for rootful docker
    # overwrite with new service ExecStart
    sudo curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/apps/docker/docker.conf --create-dirs -o /etc/systemd/system/docker.service.d/docker.conf
    # add hosts to daemon config file
    if [ ! -f $config ]; then
        sudo touch $config
    fi
    cat $config | jq '.hosts=["unix:///var/run/docker.sock","tcp://0.0.0.0:2375"]' | sudo tee $config

    # restart service
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    
    # Test: poll until TCP is ready (systemctl restart returns before dockerd finishes binding)
    for i in $(seq 1 10); do
        docker -H tcp://127.0.0.1:2375 version && break
        echo "attempt $i: TCP not ready yet, retrying in 2s..."
        sleep 2
    done

}
run-http() {
    sudo dockerd --tls=false -H 0.0.0.0:2375
}
"$@"
