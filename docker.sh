## Inspired by [chainlink:using-docker](https://docs.chain.link/docs/running-a-chainlink-node#using-docker)
install(){
  ## generic installer for linux 
  curl -sSL https://get.docker.com/ | sh
  
  sudo systemctl enable --now docker.service
  sudo systemctl enable --now containerd.service
  sudo usermod -aG docker $USER
  # log in again
}

$@
