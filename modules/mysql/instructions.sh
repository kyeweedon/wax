
# kye
# 2014.06.21
# 2014.06.22

function install {

	log wait "installing mysql"
	if ! hash mysql 2>/dev/null; then

		sudo yum install -y mysql mysql-server >>$logfile
		sudo /etc/init.d/mysqld restart >>$logfile

		log good "mysql installed"
		log info "please run \"/usr/bin/mysql_secure_installation\" to secure mysql"

	else

		log good "mysql installed"

	fi

}

function remove {

	log wait "removing mysql"
	sudo /etc/init.d/mysqld stop >>$logfile
	sudo yum remove -y mysql mysql-server >>$logfile
	log good "mysql removed"

}
