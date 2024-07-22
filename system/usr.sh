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
reset-user-password(){
  reset-password $USER
}
rotate-user-password(){
  # need current password
  passwd $USER
}
create(){
  sudo useradd -m $1
}
$@
