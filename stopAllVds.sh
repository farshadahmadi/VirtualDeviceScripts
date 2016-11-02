#!/bin/bash

for i in {1..10}
do

  cd vd"$i"

  ./stop.sh

  cd ..

done
