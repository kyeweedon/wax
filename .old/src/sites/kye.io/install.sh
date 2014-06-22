#!/usr/bin/env bash

# kye
# 2014.06.03
# 2014.06.10

# vars {
server="$HOSTNAME"
# }

echo ""
echo "Installing site: kye.io"
sudo service nginx stop

# source site {
case $server in

	# local {
	kye.loc)

		echo "Local working directory for kye.io is installed!"

	;;
	# }

	# development {
	kye.dev)

		sudo rm -rf /srv/kye.io
		sudo mkdir -pv /srv/kye.io
		cd /srv/kye.io
		git init
		git remote add gh git@github.com:kyeweedon/www.kye.io.git
		git pull gh master
		npm install
		# npm test

	;;
	# }

	# production {
	kye.pro)

		sudo rm -rf /srv/kye.io
		sudo mkdir -pv /srv/kye.io
		cd /srv/kye.io
		git init
		git remote add gh git@github.com:kyeweedon/www.kye.io.git
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
