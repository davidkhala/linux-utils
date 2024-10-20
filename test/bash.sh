printRest() {
    echo "$@"
}
testAppend() {
    ../editors.sh append newkey=value .env
}
config() {
    ../editors.sh configure key=value ./.env
}
$@
