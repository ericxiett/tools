#!/bin/bash

set -ex

echo "******************************************"
echo "* Get md5 sum of files in specify folder *"
echo "*   Please copy this script to folder    *"
echo "******************************************"

base_path=$(cd `dirname $0`; pwd)
cd $base_path

output_file=$base_path"/md5sum.txt"
if [[ -e $output_file ]]; then
    rm -rf $output_file
fi

for file_abs in $base_path/*
do
    tmp_file=`basename $file_abs`
    echo $tmp_file
    if [[ $0 != $tmp_file ]]; then
        md5sum $tmp_file >> $output_file
    fi
done
        
