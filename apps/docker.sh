## Note: below is for reference only, please switch to use platform specific install tools
diagnose() {
	ls -al /var/run/docker.sock
}
## Inspired by [chainlink:using-docker](https://docs.chain.link/docs/running-a-chainlink-node#using-docker)
install() {
  ## generic installer for linux
  curl -sSL https://get.docker.com/ | sh
  
}
rootless(){
	dockerd-rootless-setuptool.sh install

}
rootful(){
	# On Debian and Ubuntu, the Docker service is configured to start on boot by default. 
 	sudo systemctl enable --now containerd.service
	sudo systemctl enable --now docker.service
 
  	sudo usermod -aG docker $USER
  	# log in again
}

$@
