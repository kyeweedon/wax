
# kye
# 2014.06.21
# 2014.06.23

function install {

	# ${1} default node version to intall

	log wait "installing nvm"
	if ! hash nvm 2>/dev/null; then

		git clone -q https://github.com/creationix/nvm.git ${HOME}/.nvm >>${logfile}

		if ! grep -qc "nvm.sh" ${HOME}/.bashrc; then

			printf "[ -s \"${HOME}/.nvm/nvm.sh\" ] && . \"${HOME}/.nvm/nvm.sh\"  # This loads nvm" >> ${HOME}/.bashrc

		fi

	fi

	log update "installing default node version"
	local njsVersion=$(curl -s semver.io/node/stable)
	test "${1}" && njsVersion=$(curl -s semver.io/node/resolve/${1}/)

	nvm install ${njsVersion} >> ${logfile} 2>&1
	nvm alias default ${njsVersion} >> ${logfile} 2>&1
	nvm use default >> ${logfile} 2>&1

	log good "nvm installed"
	log info "using node ${njsVersion} as default"

}

# function remove {
#
# 	log wait "removing x"
#
# 	log good "x removed"
#
# }
