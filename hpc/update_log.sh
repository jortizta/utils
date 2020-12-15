#!/bin/bash

for i in log_r*

do

  str="${i:5}"
  number=$((10#$str+0))
  
  #if [ "$number" -g "$number_o"]
 
  #final=$number

  #fi 

  #number_o=$number
  

  #echo $number
  #echo $str

done

nn=$(($number+1))

echo $nn

printf -v out "%04d" $nn

#echo out

outstr="log_r$out"

echo $out

echo $i

sed -i -e 's/'$i'/'$outstr'/g' run.job

#sed -i '222s/.*/     resstep = '$m'/' eddy.input






