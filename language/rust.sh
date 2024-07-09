install() {
  curl https://sh.rustup.rs -sSf | sh
}
uninstall(){
  rustup self uninstall

}
$@
