#!/usr/bin/env bash

# kye
# 2014.06.03
# 2014.06.10

# vars {
waxDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
server="$HOSTNAME"
# }

echo ""
echo "Importing new config:"
sudo cp -f $waxDir/src/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp -f $waxDir/src/nginx/global/default.conf /etc/nginx/global/default.conf
sudo cp -f $waxDir/src/nginx/global/${server/kye/http}.conf /etc/nginx/global/http.conf
sudo cp -f $waxDir/src/nginx/global/${server/kye/server}.conf /etc/nginx/global/server.conf

echo "Importing default pages"
sudo rm -rf /srv/localhost/*
sudo cp $waxDir/src/nginx/localhost/* /srv/localhost

echo "Restarting nginx:"
sudo service nginx restart

echo "Done"
echo ""
