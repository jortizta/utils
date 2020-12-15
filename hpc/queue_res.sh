#!/bin/bash

j=1
k=1

for string in p_*.res
do
    echo $string
    i=$(echo $string | egrep -o '[0-9]{8}')

    size_i=`du -b p_$i.res | cut -f1`
    #echo $size_i

    if [ $i > $j ]; then
    
        k=$j
        j=$i
	#echo "k = $k"
	#echo "j = $j"
	#echo "      "
        
    fi     

done

 




size_k=`du -b p_$k.res | cut -f1`
size_j=`du -b p_$j.res | cut -f1`

#echo $size_k
#echo $size_j

if [[ $size_k -gt $size_j ]]
then
#    echo $k
    m=$((10#$k))
else
#    echo $j
    m=$((10#$j))
fi	

#echo $m

sed -i '223s/.*/     var = '$m'/' file.input
