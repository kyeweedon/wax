#!/usr/bin/env bash

# kye
# 2014.06.10
# 2014.06.10

# vars {
origin="$(pwd)"
server="$HOSTNAME"
# }

echo ""
echo "Installing site: prox.ee"

# source site {
case $server in

	# local {
	kye.loc)

		echo "Local working directory for prox.ee is installed!"

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

# install {
cd /srv/prox.ee
npm install
cd $origin
# }

echo ""
