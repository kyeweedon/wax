
# kye
# 2014.06.21
# 2014.06.23

function install {

	# ${1} node version to install (default: latest stable)

	# ensure version provided {
	if [[ -z "${1}" ]]; then

		log stop "please specify a version to install"
		log info "example: \"wax install node 0.10\""
		return 1

	fi
	# }

	# ensure nvm installed {
	if ! hash nvm 2>/dev/null; then

		log stop "please install \"nvm\" first"
		log info "use \"wax install nvm [default-node-version]\""
		return 1

	fi
	# }

	log wait "installing node ${1}"
	local njsVersion=$(curl -s semver.io/node/resolve/${1}/)
	nvm install ${njsVersion} >>${logfile} 2>&1
	log good "node ${njsVersion} installed"

}

function use {

	# ensure version provided {
	if [[ -z "${1}" ]]; then

		log stop "please specify a version to use"
		log info "example: \"wax use node 0.10\""
		return 1

	fi
	# }

	# ensure nvm installed {
	if ! hash nvm 2>/dev/null; then

		log stop "please install \"nvm\" first"
		log info "use \"wax install nvm [default-node-version]\""
		return 1

	fi
	# }

	log wait "switching to node ${1}"
	local njsVersion=$(curl -s semver.io/node/resolve/${1}/)
	nvm install ${njsVersion} >> ${logfile} 2>&1
	nvm alias default ${njsVersion} >> ${logfile} 2>&1
	nvm use default >> ${logfile} 2>&1
	log good "now using node ${njsVersion}"

}

# function remove {
#
# 	log wait "removing x"
#
# 	log good "x removed"
#
# }
