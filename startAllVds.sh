#!/bin/bash

for i in {10..29}
do

  cd vd"$i"

  ./start.sh

  cd ..

done
