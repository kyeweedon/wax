
# kye
# 2014.06.21
# 2014.06.21

function install {

	# already installed {
	if grep -q "alias wax=" "$HOME/.bashrc"; then

		log "good" "wax already installed"
		log "info" "if wax doesn't run, try closing this session & logging in again"
		return 0

	fi
	# }

	# install {
	echo "alias wax=\"sh $modules/wax/wax\"" >> $HOME/.bashrc
	log "good" "wax installed"
	log "stop" "please close this session & log in again to use wax"
	return 1
	# }

}
