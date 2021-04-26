set -e
installCloneTool (){
  curl https://rclone.org/install.sh | sudo bash
  
}


$@
