#!/bin/sh
dir=$1
if [ -z $dir ]
    then
    echo error: need a directory name in current directory as argument
    exit 1
fi
mv -v $dir/*/ ~/Music/ripped/$1
rmdir -v $1
exit
