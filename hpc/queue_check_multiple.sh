#!/bin/bash
echo "--------------------"

for i in $(seq 1 28800000)
do
sleep 5m
rm qview_grep.dat
qstat | grep 'user' > qview_grep.dat

n=$(sed 's/background/background\n/g' qview_grep.dat | grep -c "background")

echo $n

if [ $n -lt 3 ]
then
  echo not found: submit new job
  qsub run.job

else
  echo found: do nothing  
fi

done


