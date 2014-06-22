#!/usr/bin/env bash

# kye
# 2014.06.03
# 2014.06.10

# vars {
server="$HOSTNAME"
# }

echo ""
echo "Updating site: kye.io"
sudo service nginx stop

# source site {
case $server in

	# local {
	kye.loc)

		echo "Local working directory for kye.io is up to date!"

	;;
	# }

	# development {
	kye.dev)

		cd /srv/kye.io
		git pull gh master
		npm install
		# npm test

	;;
	# }

	# production {
	kye.pro)

		cd /srv/kye.io
		git pull gh master
		npm install

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
