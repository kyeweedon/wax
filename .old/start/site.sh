
# kye
# 2014.06.10
# 2014.06.10

# vars {
waxDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
# }

# ensure site {
if [ ! -d "$waxDir/src/sites/$1" ]; then

	echo "Recipie for $1 not found"

else

	source $waxDir/src/sites/$1/start.sh

fi
# }
