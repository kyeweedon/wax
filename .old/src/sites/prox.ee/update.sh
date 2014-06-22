#!/usr/bin/env bash

# kye
# 2014.06.10
# 2014.06.10

# vars {
server="$HOSTNAME"
# }

echo ""
echo "Updating site: prox.ee"
sudo service nginx stop

# source site {
case $server in

	# local {
	kye.loc)

		echo "Local working directory for prox.ee is up to date!"

	;;
	# }

	# development {
	kye.dev)

		echo "TODO"

	;;
	# }

	# production {
	kye.pro)

		echo "TODO"

	;;
	# }

	# else {
	*)

		echo "Host not recognised!"

	;;
	# }

esac
# }

sudo service nginx start
echo ""
