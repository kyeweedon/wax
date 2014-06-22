
# kye
# 2014.06.10
# 2014.06.10

# vars {
waxDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
# }

echo ""

# ensure site {
if [ ! -d "$waxDir/src/sites/$1" ]; then

	echo "Recipie for $1 not found"

else

	sudo cp -f $waxDir/src/sites/$1/nginx.conf /etc/nginx/conf.d/$1.conf
	source $waxDir/src/sites/$1/install.sh

fi
# }

echo ""
