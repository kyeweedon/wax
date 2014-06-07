#!/usr/bin/env bash

# kye.io
# 2014.06.03
# 2014.06.03

StartDir="$(pwd)"

# ensure linux {
if [ "$(uname -s)" != "linux" ]; then
	
	echo "$(uname -s) is not supported."
	exit 2
	
fi
# }

# ensure package manager {
if [ -z "$(command -v yum)" ]; then
	
	echo "Requires yum package manager"
	exit 2
	
fi
# }

# install prereqs {

# git 1.7+ {
if [ -z "$(git --version | grep 1.7)" ]; then
	
	echo "Requires git v1.7+"
	exit 2
	
fi
# }

# }

# epel & remi {
cd ~
curl -o http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-6*.rpm
# }

# docker {
sudo yum -y install docker-io
# }

# debug {
echo "using $(uname -s)"
# }
