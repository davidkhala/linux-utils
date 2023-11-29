post-install() {
    
    /usr/bin/mysql_secure_installation
    sudo systemctl enable --now mariadb.service

}
$@
