
# kye
# 2014.06.23
# 2014.06.23

function install {

	log wait "installing nodemon"
	if ! hash npm 2>/dev/null; then

		log fail "\"npm\" not found"
		return 1

	fi

	npm install -g nodemon >> ${logfile} 2>&1
	log good "nodemon installed"

}

# function update {
#
# 	log wait"updating x"
# 	log good "x up to date"
#
# }

# function remove {
#
# 	log wait "removing x"
# 	log good "x removed"
#
# }
