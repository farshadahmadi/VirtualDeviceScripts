#!/bin/bash

GIT_URL=https://github.com/farshadahmadi/liquidiot-server.git

for I in {10..60}
do

  #I=3;

  git clone $GIT_URL vd"$I"

  cd vd"$I"

  git checkout dev

  let "remainder = $I % 2"

  if [ "$remainder" -eq 0 ]; then
    sed '1d; 3,4d;' <config-template.txt> config.txt
  else
    sed '1,3d;' <config-template.txt> config.txt
  fi

  let SERVER_PORT="10000 + $I"

  SERVER_URL='http://130.230.142.100:'"${SERVER_PORT}"''

  let SERVER_APPS_STARTPORT="8001 + (($I - 1) * 10)"

  configContent=$(cat config.txt | ../jq-linux64 '.url = "'"$SERVER_URL"'" | .port = '"${SERVER_PORT}"' | .startportrange = '"${SERVER_APPS_STARTPORT}"' | .idFromBackend = "1"')

  echo $configContent > config.txt

  cp dm-config-template.txt dm-config.txt
 DM_URL="http://130.230.142.101:3001/"

  dmConfigContent=$(cat dm-config.txt | ../jq-linux64 '.url = "'"$DM_URL"'"')

  echo $dmConfigContent > dm-config.txt

  cp backend-config-template.txt backend-config.txt

  sed 's/vd/vd'"${I}"'/g' ../start.sh > start.sh

  chmod +x start.sh
  
  sed 's/vd/vd'"${I}"'/g' ../stop.sh > stop.sh

  chmod +x stop.sh
  
  cd ..

done
