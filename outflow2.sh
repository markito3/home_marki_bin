#!/bin/bash
input_dir=$1
output_dir=$2
output_node=$3
rsync_command="rsync -ruvt $input_dir/ ${output_node}:$output_dir/"
echo rsync_command = $rsync_command
status="255"
while [ "$status" -eq "255" ]
do
    $rsync_command
    status="$?"
    echo status = $status
    sleep 1
done
cd $input_dir
find . -type f -mmin +120 | sort > /tmp/input_files_list.txt
ssh $output_node cd $output_dir \; find . -type f | sort > /tmp/output_files_list.txt
comm -12 /tmp/input_files_list.txt /tmp/output_files_list.txt | xargs rm -v
