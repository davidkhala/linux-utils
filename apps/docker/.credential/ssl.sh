set -e
HOST=${HOST:-localhost}
ca() {
    # generate CA private and public keys
    openssl genrsa -out ca-key.pem 4096
    openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
}
server() {
    # create a server key and certificate signing request (CSR)
    openssl genrsa -out server-key.pem 4096
    openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
}
sign() {
    # sign the public key with our CA:
    echo subjectAltName = DNS:$HOST,IP:0.0.0.0,IP:127.0.0.1 >>extfile.cnf
    echo extendedKeyUsage = serverAuth >>extfile.cnf

    openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf
}
clean() {
    rm -v server.csr extfile.cnf
}
run() {
    sudo dockerd --tlsverify -H=0.0.0.0:2376 \
        --tlscacert=ca.pem \
        --tlscert=server-cert.pem \
        --tlskey=server-key.pem
}
connect() {
    docker --tlsverify -H=$HOST:2376 \
        --tlscacert=ca.pem \
        --tlscert=cert.pem \
        --tlskey=key.pem \
        version
}
"$@"
