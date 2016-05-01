#!/bin/sh
pushd /home/backup/renee
rm -rf weekly.2
mv -v weekly.1 weekly.2
mv -v weekly.0 weekly.1
cp -al backup.0 weekly.0
exit
