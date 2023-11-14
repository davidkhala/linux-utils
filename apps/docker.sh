## Note: below is for reference only, please switch to use platform specific install tools
diagnose() {
	ls -al /var/run/docker.sock
}
system-service() {
	# On Debian and Ubuntu, the Docker service is configured to start on boot by default. 
 	sudo systemctl enable --now containerd.service
	sudo systemctl enable --now docker.service
}

## Inspired by [chainlink:using-docker](https://docs.chain.link/docs/running-a-chainlink-node#using-docker)
install() {
  ## generic installer for linux
  curl -sSL https://get.docker.com/ | sh

  system-service
  sudo usermod -aG docker $USER
  # log in again
}

$@
