set -e
setup() {
  curl https://rclone.org/install.sh | sudo bash

}

$@
