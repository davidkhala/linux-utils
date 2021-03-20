install(){
  ## generic installer for linux 
  curl -sSL https://get.docker.com/ | sh
  
  sudo usermod -aG docker $USER
  
  # log in again
}
$@
