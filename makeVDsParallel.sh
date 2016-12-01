#!/bin/bash
#!/bin/bash

ARRAY=()

COUNTER=0

for I in {102..117}
do
ARRAY[$COUNTER]=TE"$I"
((COUNTER++))
done

for J in {102..116}
do
ARRAY[$COUNTER]=TF"$J"
((COUNTER++))
done

for K in {102..161}
do
ARRAY[$COUNTER]=TC"$K"
((COUNTER++))
done

COUNTER=0

echo ${ARRAY[*]}

for i in {10..29}
do
  ./makeVD.sh $i ${ARRAY[$COUNTER]} &
  ((COUNTER++))
done

wait
