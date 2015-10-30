#!/bin/sh
pushd /scratch/backup_renee
rm -rf daily.3
mv -v daily.2 daily.3
mv -v daily.1 daily.2
mv -v daily.0 daily.1
cp -al backup.0 daily.0
exit
