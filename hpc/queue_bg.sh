#!/bin/bash

#sleep 4h

echo "-------------------"
echo "START SCRIPT_COPPER"
echo "-------------------"
echo "   SUBMIT JOB 1    "
echo "-------------------"
qsub run.job

for i in $(seq 2 1000);
do   
   for j in 1
   do
       sleep 1h
       echo "-------------------"
       echo "   $j hours pass   "      
       echo "-------------------"    
   done
#   sleep 4h   
qsub run.job
echo "-------------------"
echo "   SUBMIT JOB $i   "    
echo "-------------------"
done
echo "-------------------"
echo "       DONE        "    
echo "-------------------"



