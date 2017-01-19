#!/bin/bash

ROOMS=()

COUNTER=28

#ROOMS[0]='TF115;220.200;390.200'
#ROOMS[1]='TF113;220.350;390.350'
#ROOMS[2]='TF111;220.490;390.490'
#ROOMS[3]='TF109;220.630;390.630'
#ROOMS[4]='TF105;220.770;390.770;220.890;390.890'
#ROOMS[5]='TF103;220.1030;390.1030;220.1170;390.1170;220.1310;390.1310'
ROOMS[6]='TC103;1700.2300'

echo ${ROOMS[*]}

for j in "${ROOMS[@]}"
do
  arr=(${j//;/ });
  ROOM_NUMBER=${arr[0]}
  ARR_LENGTH=${#arr[@]};
  for ((k=1;k<ARR_LENGTH;k++))
  do
    #echo $ROOM_NUMBER
    #echo ${arr[$k]}
    ./makeVD.sh $COUNTER $ROOM_NUMBER ${arr[$k]} &
    ((COUNTER++))
  done
done

wait
