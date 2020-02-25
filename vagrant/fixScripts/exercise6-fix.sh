#!/bin/bash
total_file_size=0
dest_folder="${@: -1}"

if [ $HOSTNAME == "server1" ]; then
 for i in $@; do
   if [ $i != $dest_folder ]; then
    file_size=$(wc -c $i | awk '{print $1}')
    $(scp $i vagrant@server2:/$dest_folder)
    total_file_size=$((total_file_size + file_size))
   fi
done
else
 for i in $@; do
   if [ $i != $dest_folder ]; then
    file_size=$(wc -c $i | awk '{print $1}')
    $(scp $i vagrant@server1:/$dest_folder)
    total_file_size=$((total_file_size + file_size))
   fi
done
fi
echo "$total_file_size"
