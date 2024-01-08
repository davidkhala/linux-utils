prepare-home-dir(){
  local targetUser=$1
  sudo mkhomedir_helper $targetUse
}
$@
