## util for sed, awk, grep, tee or even vim
configure(){
  local configline=$1
  local file=$2
  grep -qF -- "$configline" "$file" || echo "$configline" >> "$file"
}
$@
