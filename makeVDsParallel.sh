#!/bin/bash

for i in {1..4}
do
  ./makeVD.sh $i &
done

wait
