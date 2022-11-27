install-libtool(){
	lsb_dist=""
	if [ -r /etc/os-release ]; then
		lsb_dist="$(. /etc/os-release && echo "$ID")"
	fi
	
	case "$lsb_dist" in

		ubuntu)
			sudo apt-get install -y libtool
		;;

		debian|raspbian)
			sudo apt-get install -y libtool
		;;

		centos|rhel|sles)
			sudo dnf -y install libtool
		;;
    		*)
		      if [[ $(uname) == "Darwin" ]]; then
			brew install libtool
		      fi
	    	;;
	esac
}
$@
