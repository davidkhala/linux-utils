set -e
HOST=${HOST:-localhost}
DOCKER_CERT_PATH=~/.docker/
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
client() {
    # create a client key and certificate signing request
    openssl genrsa -out key.pem 4096

    openssl req -subj '/CN=client' -new -key key.pem -out client.csr

    echo extendedKeyUsage = clientAuth >extfile-client.cnf

    openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile-client.cnf
}
sign() {
    # sign the public key with our CA:
    echo subjectAltName = DNS:$HOST,IP:0.0.0.0,IP:127.0.0.1 >>extfile.cnf
    echo extendedKeyUsage = serverAuth >>extfile.cnf

    openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf
}
clean() {
    rm -v client.csr server.csr extfile.cnf extfile-client.cnf
}
run() {
    sudo dockerd --tlsverify -H=0.0.0.0:2376 --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem
}
run-noAuth() {
    # FIXME Do not authenticate clients
    # https://docs.docker.com/engine/security/protect-access/#daemon-modes
    sudo dockerd --tls -H=0.0.0.0:2376 --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem
}
connect() {
    docker --tlsverify -H=$HOST:2376 \
        --tlscacert=ca.pem \
        --tlscert=cert.pem \
        --tlskey=key.pem \
        version
}
connect-noAuth() {
    # FIXME Do not authenticate clients
    # https://docs.docker.com/engine/security/protect-access/#daemon-modes
    docker --tlsverify -H=$HOST:2376 --tlscacert=ca.pem version
}
"$@"
