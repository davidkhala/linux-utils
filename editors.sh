## util for sed, awk, grep, tee, vim, xclip
append(){
  local content=$1
  local file=$2
  echo $content | sudo tee -a $file
}
configure() {
  local configline=$1
  local file=$2
  grep -qF -- "$configline" "$file" || append "$configline" "$file"
}
clip() {
  xclip -sel clip $1
}
$@
