set -e
version=${version:-25.1}

user-install(){
    _install $HOME/.local

}
_install(){
    PB_REL="https://github.com/protocolbuffers/protobuf/releases"
    FILENAME=protoc-${version}-linux-$(uname -p).zip
    curl -LO $PB_REL/download/v${version}/${FILENAME}
    unzip $FILENAME -d $1
    rm $FILENAME
    
}
system-install() {
    _install /usr/local
    
}
version() {
    protoc --version
}
$@
