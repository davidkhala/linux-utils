install_libtool(){

	case "$lsb_dist" in

		ubuntu)
			sudo apt-get install -y libtool
		;;

		debian|raspbian)
			sudo apt-get install -y libtool
		;;

		centos|rhel|sles)
			
		;;
    *)
      if [[ $(uname) == "Darwin" ]]; then
        brew install libtool
      fi
    ;;
		

	esac
	
}
