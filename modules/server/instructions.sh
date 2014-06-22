
# kye
# 2014.06.20
# 2014.06.21

function build {

	# args
	# $1 instruction
	# $2 module
	# $3 path to waxfile (opt)
	# echo "$*"

	local waxfile=$modules/$2/waxfile

	# locate waxfile {
	if [ "$3" ]; then

		waxfile=$3

	fi
	# }

	# ensure waxfile exists {
	if [[ ! -f $waxfile ]]; then

		log "stop" "waxfile not found"
		log "info" "option 1. place waxfile at \".wax/modules/$2/waxfile\""
		log "info" "option 2. use \"wax $1 $2 <path/to/waxfile>\""
		return 1

	fi
	# }

	# source waxfile {
	source $waxfile
	# }

	# set hostname {
	log wait "setting hostname"
	sudo hostname $hostname
	log good "hostname set to $hostname"
	# }

	# update server {
	log wait "updating server packages"
	sudo yum check-update >&/dev/null
	if ! [ "$?" = 0 ]; then

		sudo yum update -y &>$logs/wax.log

	fi
	log good "server packages up to date"
	# }

	# set timezone {
	log wait "setting timezone"
	if [ ! -f "/usr/share/zoneinfo/$timezone" ]; then

		log fail "can't set timezone \"$timezone\""

	else

		if ! ls -l /etc/localtime | grep -q $timezone -; then

			sudo ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

		fi
		log good "timezone set to \"$timezone\""

	fi
	# }

	# alias ls {
	log wait "creating alias commands"
	if ! grep -q "alias ls=" $HOME/.bashrc; then

		echo "alias ls=\"ls -l --color\"" >> $HOME/.bashrc

	fi
	if ! grep -q "alias lsa=" $HOME/.bashrc; then

		echo "alias lsa=\"ls -a\"" >> $HOME/.bashrc

	fi
	log good "alias commands created (may require relog)"
	# }

}
