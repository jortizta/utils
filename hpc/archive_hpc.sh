#!/bin/sh
#ACCOUNT
#PBS -A

#QUEUE
#PBS -q transfer

#WALL TIME
#PBS -l walltime=24:00:00

#NUMBER OF PROCESSORS
#PBS -l select=1:ncpus=1

#STANDARD ERROR
#PBS -e file.err

#STANDARD OUT
#PBS -o log_archiving

#JOB NAME
#PBS -N archiving

#RUN

path=
dir=


archive mkdir $dir
archive mkdir $dir/run/
archive mkdir $dir/run/files1
archive mkdir $dir/run/files2

cd $path$dir
tar -czvf src.tar.gz ./  --exclude='run'
archive put -C $dir src.tar.gz  >~/log_archiving

cd $path$dir/run
tar -czvf run.tar.gz ./ --exclude='*.res' --exclude='files1' --exclude='*.tno'\
 --exclude='*.5p' --exclude='*.pln' --exclude='planes' --exclude='tnofiles' --exclude='files1'

archive put -C $dir/run run.tar.gz  >~/log_archiving


cd $path$dir/run/files1


var='uvwp'

for j in `seq 0 3`;
do

    for i in ${var:j:1}_*.res 
    do 
    
    str="${i:2:8}"  
    number=$((10#$str+0)) 
    
    archive put -C $dir/run/files1/ $i >~/log_archiving
    echo $i 'archived'

    done

done


dens=(dens_*.res)

if [ -f ${dens[0]} ]; then

    echo 'archiving density files'

    for i in dens_*.res 
    do 
 
    str="${i:5:8}"  
    number=$((10#$str+0)) 
    
    archive put -C $dir/run/files1/ $i >~/log_archiving

    echo $i 'archived'
    
    done

fi

# SAVING files2

var='uvwp'


cd $path$dir/run/files2

for j in `seq 0 3`;
do

    for i in ${var:j:1}p_*.5p 
    do 
    
    #str="${i:3:8}"  
    #number=$((10#$str+0)) 

    #echo str    

    archive put -C $dir/run/files2/ $i >log_archiving 
    echo $i 'archived'

    done

done


dens=(densp_*.5p)

if [ -f ${dens[0]} ]; then

    echo 'archiving density files'

    for i in dens_*.5p 
    do 
 
    #str="${i:6:8}"  
    #number=$((10#$str+0)) 
    
    archive put -C $dir/run/files2/ $i >log_archiving

    echo $i 'archived'
    
    done

fi

tv=(tvp_*.5p)

if [ -f ${tv[0]} ]; then

    echo 'archiving density files'

    for i in tvp_*.res 
    do 
 
    #str="${i:6:8}"  
    #number=$((10#$str+0)) 
    
    archive put -C $dir/run/files2/ $i >log_archiving

    echo $i 'archived'
    
    done

fi


echo "data archiving done"




echo "data archiving done"



