## Note: below is for reference only, please switch to use platform specific install tools
diagnose() {
	ls -al /var/run/docker.sock
}
## Inspired by [chainlink:using-docker](https://docs.chain.link/docs/running-a-chainlink-node#using-docker)
install() {
	## generic installer for linux
	curl -sSL https://get.docker.com/ | sh

}
install-rootless() {
	# NOTE PLEASE run this without 'sudo', otherwise ENV $USER will be 'root' instead of current user.
	# See in https://docs.docker.com/engine/security/rootless/
	curl -sSL https://get.docker.com/rootless | sh
	export DOCKER_HOST=unix:///run/user/$UID/docker.sock
}
rootless() {
	dockerd-rootless-setuptool.sh install
	export DOCKER_HOST=unix:///run/user/$UID/docker.sock
}

rootful() {
	# uninstall rootless
	if dockerd-rootless-setuptool.sh check; then
		dockerd-rootless-setuptool.sh uninstall
	fi

	# On Debian and Ubuntu, the Docker service is configured to start on boot by default.
	sudo systemctl enable --now containerd.service # optional
	sudo systemctl enable --now docker.service     # optional
	sudo groupadd docker
	sudo usermod -aG docker $USER
	echo Please open a new shell to see the effect...
	newgrp docker

}

$@
