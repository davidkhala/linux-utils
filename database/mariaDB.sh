post-install() {
    curl https://raw.githubusercontent.com/davidkhala/fedora-utils/master/mysql/setup.sh | bash -s firewall
    /usr/bin/mysql_secure_installation
    sudo systemctl enable --now mariadb.service

}
$@
