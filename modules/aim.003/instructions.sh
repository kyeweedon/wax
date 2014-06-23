
# kye
# 2014.06.21
# 2014.06.23

function install {

	log wait "installing aim.003 source"
	if [[ "${HOSTNAME}" == "kye.loc" ]]; then

		log good "aim.003 sourced by vagrant"

	else

		log good "aim.003 source installed"

	fi

	log wait "configuring nginx"
	sudo cp -f ${me}/src/nginx.${HOSTNAME: -3}.conf /etc/nginx/conf.d/aim.003.conf
	log good "nginx configured"

	wax restart nginx

}

function update {

	log wait"updating aim.003 source"
	log good "aim.003 source up to date"

}

# function remove {
#
# 	log wait "removing x"
#
# 	log good "x removed"
#
# }

function start {

	# ${1} environment

	wax use node 0.10.29
	log info "starting aim.003..."

	case ${1} in

		nodemon)

			nodemon /srv/aim/003/mech/server.js

		;;

		*)

			node /srv/aim/003/mech/server.js

		;;

	esac

	log good "aim.003 stopped"

}
