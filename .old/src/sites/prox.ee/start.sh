
# kye
# 2014.06.10
# 2014.06.15

nvm use 0.11

case $2 in

	# debug {
	debug)

		node-inspector &
		node --debug --harmony /srv/prox.ee/server/start

	;;
	# }

	# else {
	*)

		node --harmony /srv/prox.ee/server/start

	;;
	# }

esac
