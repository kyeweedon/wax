
# kye
# 2014.06.21
# 2014.06.21

function install {

	log wait "installing nginx"
	if ! hash nginx 2>/dev/null; then

		sudo cp -f $modules/nginx/src/nginx.repo /etc/yum.repos.d/nginx.repo
		sudo yum install -y nginx >$logFile
		sudo chkconfig nginx on
		sudo service nginx stop >$logFile

		sudo mkdir -p /srv
		sudo mkdir -p /etc/nginx/global
		sudo rm -rf /etc/nginx/global/*
		sudo mkdir -p /etc/nginx/global/http
		sudo mkdir -p /etc/nginx/global/server

		sudo cp -rf $modules/nginx/src/localhost /srv
		sudo cp -f $modules/nginx/src/nginx.conf /etc/nginx/nginx.conf
		sudo cp -f $modules/nginx/src/global/proxy.conf /etc/nginx/global/proxy.conf
		sudo cp -f $modules/nginx/src/global/public.conf /etc/nginx/global/public.conf
		sudo cp -f $modules/nginx/src/global/http/default.conf /etc/nginx/global/http/default.conf
		sudo cp -f $modules/nginx/src/global/server/default.conf /etc/nginx/global/server/default.conf
		sudo cp -f $modules/nginx/src/global/http/"${HOSTNAME: -3}".conf /etc/nginx/global/http/extra.conf
		sudo cp -f $modules/nginx/src/global/server/"${HOSTNAME: -3}".conf /etc/nginx/global/server/extra.conf

		sudo service nginx start >$logFile

	fi
	log good "nginx installed"

}

function refresh {

	log wait "refreshing nginx"
	if ! hash nginx 2>/dev/null; then

		log fail "nginx isn't installed"

	else

		sudo service nginx stop >$logFile

		sudo rm -rf /etc/nginx/global/*
		sudo mkdir -p /etc/nginx/global/http
		sudo mkdir -p /etc/nginx/global/server

		sudo cp -rf $modules/nginx/src/localhost/* /srv/localhost/
		sudo cp -f $modules/nginx/src/nginx.conf /etc/nginx/nginx.conf
		sudo cp -f $modules/nginx/src/global/proxy.conf /etc/nginx/global/proxy.conf
		sudo cp -f $modules/nginx/src/global/public.conf /etc/nginx/global/public.conf
		sudo cp -f $modules/nginx/src/global/http/default.conf /etc/nginx/global/http/default.conf
		sudo cp -f $modules/nginx/src/global/server/default.conf /etc/nginx/global/server/default.conf
		sudo cp -f $modules/nginx/src/global/http/"${HOSTNAME: -3}".conf /etc/nginx/global/http/extra.conf
		sudo cp -f $modules/nginx/src/global/server/"${HOSTNAME: -3}".conf /etc/nginx/global/server/extra.conf

		sudo service nginx start >$logFile

	fi
	log good "nginx refreshed"

}
