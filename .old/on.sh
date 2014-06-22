#!/usr/bin/env bash

# kye
# 2014.06.03
# 2014.06.10

# vars {
waxDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
server="$HOSTNAME"
njsDevVersion="0.11.13"
njsProVersion="0.10.29"
# }

echo ""
echo "====== ====== ====== ====== ====== ====== ====== ====== ======"
echo "                            wax on"

# debug {

# }

echo "------ ------ ------ ------ ------ ------ ------ ------ ------"
echo ""

# update server
sudo yum update -y

# set timezone
sudo ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime

# alias ls
if ! grep -q "alias ls=" "$HOME/.bashrc" ; then

	echo "alias ls=\"ls -l --color\"" >> $HOME/.bashrc
	source $HOME/.bashrc

fi

# install nginx
if ! hash nginx 2>/dev/null; then

	echo "Installing nginx:"
	sudo cp -f $waxDir/src/nginx/nginx.repo /etc/yum.repos.d/nginx.repo
	sudo yum install -y nginx
	sudo chkconfig nginx on
	sudo mkdir /etc/nginx/global
	sudo mkdir -p /srv/localhost

	source $waxDir/refresh/nginx.sh
else

	echo "nginx: yup"

fi

# install mysql
if ! hash mysql 2>/dev/null; then

	echo "Installing mysql:"
	sudo yum install -y mysql mysql-server
	sudo /etc/init.d/mysqld restart
	sudo /usr/bin/mysql_secure_installation

else

	echo "mysql: yup"

fi

# install git
if ! hash git 2>/dev/null; then

	echo "Installing git:"
	sudo yum install -y git

else

	echo "git: yup"

fi

# install nvm
if ! hash nvm 2>/dev/null; then

	echo "Installing nvm:"
	curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh
	source $HOME/.bash_profile

else

	echo "nvm: yup"

fi

# install node
if ! hash node 2>/dev/null; then

	echo "Installing node:"
	nvm install $njsVer
	echo "nvm use $njsProVersion" >> $HOME/.bash_profile
	source $HOME/.bash_profile

else

	echo "node: yup"

fi

# install pm2
if ! hash pm2 2>/dev/null;then

	echo "Installing pm2:"
	npm install -g pm2@latest

else

	echo "pm2: yup"

fi

echo "Ready!"

echo ""
echo "------ ------ ------ ------ ------ ------ ------ ------ ------"
echo "                             done"
echo "====== ====== ====== ====== ====== ====== ====== ====== ======"
echo ""
