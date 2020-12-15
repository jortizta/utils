#!/bin/bash
echo "--------------------"
for i in $(seq 1 288)
do
sleep 5m
rm qview_grep.dat
qview | grep 'user' > qview_grep.dat
if grep -q debug qview_grep.dat; then
    echo found: do nothing
    cat qview_grep.dat | grep 'debug'

else
    echo not found: submit new job
    qsub job.run    
fi
done


