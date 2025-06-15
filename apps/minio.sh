set -e
install-client(){
  # MinIO does not officially publish its binaries to common Linux repositories or package managers (Ubuntu, RHEL, Archlinux/AUR). 
  # MinIO does not recommend installation through a package manager, as upstream repositories may install the incorrect package or a renamed package.
  curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o /usr/local/bin/mc
  chmod +x /usr/local/bin/mc
  mc --help
}
$@
