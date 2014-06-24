
# kye
# 2014.06.21
# 2014.06.23

function install {

	# build source {
	log wait "installing aim.003 source"
	if [[ "${HOSTNAME}" == "kye.loc" ]]; then

		log good "aim.003 sourced by vagrant"

	else

		log todo "install source from git"

	fi
	# }

	# configure nginx {
	log wait "configuring nginx"
	sudo cp -f ${me}/src/nginx.${HOSTNAME: -3}.conf /etc/nginx/conf.d/aim.003.conf
	log good "nginx configured"
	# }

	log wait "building database"

	# ensure mysql {
	if ! hash mysql 2>/dev/null; then

		log fail "aim.003 needs mysql"
		return 1

	fi
	# }

	# build it {
	mysql -u root -p < ${me}/src/build.sql
	# }

	log good "database built"
	# }

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

	# ${1} using (default: node)
	# ${2} flags

	wax use node 0.10.29
	log info "starting aim.003..."

	case ${1} in

		pm2)

			pm2 start /srv/aim/003/mech/server.js ${@:2} >> ${logfile} 2>&1
			pm2 logs server

		;;

		*)

			node ${@:2} /srv/aim/003/mech/server.js

		;;

	esac

	log good "aim.003 stopped"

}
