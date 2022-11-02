## util for sed, awk, grep, tee, vim, xclip
configure() {
  local configline=$1
  local file=$2
  grep -qF -- "$configline" "$file" || echo "$configline" >>"$file"
}
clip() {
  xclip -sel clip $1
}
$@
