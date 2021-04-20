#!/bin/bash
command=$*
hash=`echo $command | md5sum | awk '{print $1}'`
lock_file=/tmp/${hash}.lock
if [ -f $lock_file ]
then
    echo lock file found: $lock_file
    touch $lock_file
    echo exiting
    exit 1
fi
echo creating lock file: $lock_file
date > $lock_file
echo executing $command
$command
rm -v $lock_file
exit 0
    
