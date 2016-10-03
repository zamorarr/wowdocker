#!/bin/sh

# Usage: ./api.sh realm1 realm2 ... realmN

# Parameters
realms=$@

# Env variables
apikey=${BLIZZARD_API_KEY}

# Contstants
url=https://us.api.battle.net/wow/auction/data/
header="Accept: application/json"
locale=en_US

WD=/home/docker

# Get json data
for realm in $realms
do
  echo $realm
  curl -H "$header" $url${realm}?locale=${locale}\&apikey=$apikey > $WD/tmp.json

  # Get download link from json
  dlurl=$(cat $WD/tmp.json | grep -Eo '\"url\"\:\".+\",' | grep -Eo http://[./a-zA-Z0-9-]+\.json)
  timeval=$(cat $WD/tmp.json | grep -Eo \"lastModified\":[0-9]* | grep -Eo [0-9]+)

  # Download auction data
  curl $dlurl > $WD/auction_${realm}_${timeval}.json

  # Clean up
  rm -f $WD/tmp.json

done

# Move files to data folder
mv $WD/*.json $WD/data/
