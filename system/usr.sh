prepare-home-dir(){
  local targetUser=$1
  sudo mkhomedir_helper $targetUse
}
reset-password() {
    sudo passwd $1
}
reset-root-password(){
  reset-password
}
reset-current-password(){
  reset-password $USER
}
create(){
  sudo useradd -m $1
}
$@
