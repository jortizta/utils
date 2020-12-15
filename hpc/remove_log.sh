#!/bin/bash

#this piece of code erases wrong log files

  n=5000

for i in log_r*
do
  #echo "${i#*_}"
  #echo "${i:2:8}" 
  
  
  #str="${i:2:8}" 
  #number=$(wc -l $i)



  number=$(sed -n '$=' $i)

  #echo "$number" | wc -l $i

  #number="${number//[$'\t\r\n ']}"
  #echo $str 
  #echo $number 

 if [ "$number" -lt "$n" ]
 then

 echo "removing $i"
 rm $i
 

 fi 

done 


