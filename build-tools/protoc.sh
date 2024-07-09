set -e
version=${version:-25.1}

install() {
    PB_REL="https://github.com/protocolbuffers/protobuf/releases"
    FILENAME=protoc-${version}-linux-$(uname -p).zip
    curl -LO $PB_REL/download/v${version}/${FILENAME}
    unzip $FILENAME -d /usr/local
    rm $FILENAME
}
version() {
    protoc --version
}
$@
