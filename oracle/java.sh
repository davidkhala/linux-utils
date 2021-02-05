
JAVA_HOME(){
  if ! dirname $(dirname $(readlink -f $(which javac)));then
      echo "Failed to find JAVA_HOME"
  fi
}
$@

