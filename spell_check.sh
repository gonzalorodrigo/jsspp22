#!/bin/sh
echo $1
echo "Checking file $1"
aspell --lang=en --mode=tex check $1
var=`cat $1 | grep "\input{" | cut -d\{ -f2 | cut -d\} -f1`
echo "Dected the following input files $var"
for file in $var
do
    echo "Checking file $file"
    aspell --lang=en --mode=tex check "${file}"
done
