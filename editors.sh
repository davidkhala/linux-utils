## util for sed, awk, grep, tee, vim, xclip
set -e
append() {
  local content=$1
  local file=$2
  local inline=$3
  if [[ -z $inline ]]; then
    # default append to newline
    sudo sed -i "\$a\\$content" $file
  else
    echo $content | sudo tee -a $file
  fi

}
configure() {
  local configline=$1
  local file=$2
  local d=${3:-/} # delimiter
  read key value <<<$(echo "$configline" | awk -F= '{print $1,$2}')

  if [[ -z $value ]]; then
    echo "value is empty"
    return 1
  fi

  if grep --quiet "^$key=.*" $file; then
    sudo sed --in-place --regexp-extended "s$d^$key=.*$d$key=$value$d" $file
  else
    append "$key=$value" $file
  fi

}
clip() {
  xclip -sel clip $1
}
$@
