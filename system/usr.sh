prepare-home-dir(){
  local targetUser=$1
  sudo mkhomedir_helper $targetUse
}
reset-password() {
    sudo passwd $1
}
$@
