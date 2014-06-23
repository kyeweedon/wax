
# kye
# 2014.06.20
# 2014.06.23

function update {

	log wait "updating server packages"
	sudo yum check-update >> ${logfile} 2>&1
	if ! [[ "${?}" == 0 ]]; then

		sudo yum update -y >> ${logfile} 2>&1

	fi
	log good "server packages up to date"

}

function build {

	# ${1} path to waxfile (opt)

	local waxfile="${me}/waxfile"

	# locate waxfile {
	test "${1}" &&	waxfile="${1}"
	# }

	# waxfile {
	if [[ ! -f ${waxfile} ]]; then

		log stop "waxfile not found"
		log info "option 1. place waxfile at \"${me}/waxfile\""
		log info "option 2. use \"wax build server <path/to/waxfile>\""
		return 1

	fi
	source ${waxfile}
	# }

	# set hostname {
	log wait "setting hostname"
	sudo hostname ${hostname}
	log good "hostname set to ${HOSTNAME}"
	# }

	# update packages {
	action update server
	# }

	# set timezone {
	log wait "setting timezone"
	if [[ ! -f "/usr/share/zoneinfo/${timezone}" ]]; then

		log fail "can't set timezone \"${timezone}\""

	else

		if ! ls -l /etc/localtime | grep -q ${timezone} -; then

			sudo ln -sf /usr/share/zoneinfo/${timezone} /etc/localtime

		fi
		log good "timezone set to \"${timezone}\""

	fi
	# }

	# update profile {
	log wait "updating profile"
	if ! grep -q "# wax {" ${HOME}/.bashrc; then

		log update "injecting profile"
		echo "$(printf "# wax {\n")$(profile)$(printf "\n# wax }\n")" >> ${HOME}/.bashrc

	fi
	log good "profile updated"
	# }

	# install modules {
	for mod in "${installme[@]}"; do

		wax install ${mod}

	done
	# }

}
