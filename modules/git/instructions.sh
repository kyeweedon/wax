
# kye
# 2014.06.21
# 2014.06.21

function install {

	log wait "installing git"
	if ! hash git 2>/dev/null; then

		sudo yum install -y git >$logFile

	fi
	log good "git installed"

}
