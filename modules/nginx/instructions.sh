
# kye
# 2014.06.21
# 2014.06.23

function install {

	log wait "installing nginx"
	if ! hash nginx 2>/dev/null; then

		sudo cp -f $modules/nginx/src/nginx.repo /etc/yum.repos.d/nginx.repo
		sudo yum install -y nginx >>$logfile
		sudo chkconfig nginx on

		sudo mkdir -p /srv
		sudo mkdir -p /srv/localhost
		sudo mkdir -p /etc/nginx/global
		sudo mkdir -p /etc/nginx/global/http
		sudo mkdir -p /etc/nginx/global/server

		wax refresh nginx

	fi
	log good "nginx installed"

}

function refresh {

	log wait "refreshing nginx"
	if ! hash nginx 2>/dev/null; then

		log fail "nginx isn't installed"

	else

		sudo rm -rf /srv/localhost/*
		sudo rm -rf /etc/nginx/global/*.conf
		sudo rm -rf /etc/nginx/global/http/*.conf
		sudo rm -rf /etc/nginx/global/server/*.conf

		sudo cp -rf $modules/nginx/src/localhost/* /srv/localhost/
		sudo cp -f $modules/nginx/src/nginx.conf /etc/nginx/nginx.conf
		sudo cp -f $modules/nginx/src/global/proxy.conf /etc/nginx/global/proxy.conf
		sudo cp -f $modules/nginx/src/global/public.conf /etc/nginx/global/public.conf
		sudo cp -f $modules/nginx/src/global/http/default.conf /etc/nginx/global/http/default.conf
		sudo cp -f $modules/nginx/src/global/server/default.conf /etc/nginx/global/server/default.conf
		sudo cp -f $modules/nginx/src/global/http/${HOSTNAME: -3}.conf /etc/nginx/global/http/extra.conf
		sudo cp -f $modules/nginx/src/global/server/${HOSTNAME: -3}.conf /etc/nginx/global/server/extra.conf

	fi
	log good "nginx refreshed"
	wax restart nginx

}

function restart {

	log wait "restarting nginx"
	sudo service nginx restart >> ${logfile} 2>&1
	log good "nginx restarted"

}

function remove {

	log wait "removing nginx"
	sudo service nginx stop >>$logfile
	sudo yum remove -y nginx >>$logfile
	sudo rm -rf /srv/localhost
	sudo rm -rf /etc/nginx
	log good "nginx removed"

}
