## Inspired by [chainlink:using-docker](https://docs.chain.link/docs/running-a-chainlink-node#using-docker)
install(){
  ## generic installer for linux 
  curl -sSL https://get.docker.com/ | sh
  
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  sudo usermod -aG docker $USER
  # log in again
}

$@
