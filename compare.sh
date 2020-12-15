#!/bin/bash
#compare .f files in the current directory and in dir2
for i in *.f
do
echo $i
diff $i   /dir2/$i
done
