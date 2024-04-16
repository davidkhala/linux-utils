set -e
post-install() {
    sudo systemctl enable --now mariadb.service
    sudo /usr/bin/mysql_secure_installation # interactive wizard
}
$@
