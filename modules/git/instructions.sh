
# kye
# 2014.06.21
# 2014.06.22

function install {

	log wait "installing git"
	if ! hash git 2>/dev/null; then

		sudo yum install -y git >$logfile

	fi
	log good "git installed"

}

function remove {

	log wait "removing git"
	sudo yum remove -y git >>$logfile
	log good "git removed"

}
