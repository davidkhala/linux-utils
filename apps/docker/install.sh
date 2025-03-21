## Note: below are depedencies only, please switch to use platform specific install tools
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
	rootless-env
}
uninstall-rootless(){
	dockerd-rootless-setuptool.sh uninstall
 	rootlesskit rm -rf ~/.local/share/docker
	rm -f ~/bin/dockerd
}
rootless() {
	dockerd-rootless-setuptool.sh install
	rootless-env
}
rootless-service() {
	systemctl --user enable --now docker.service
	sudo loginctl enable-linger $USER # To run docker.service on system startup, learned from docker

}
rootless-env() {

	if [ -z "$DOCKER_HOST" ]; then
		echo "export DOCKER_HOST=unix:///run/user/$UID/docker.sock" >>~/.bashrc
		echo "export PATH=$HOME/bin:$PATH" >>~/.bashrc
		source ~/.bashrc
	fi

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

"$@"
