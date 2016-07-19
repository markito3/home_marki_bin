#!/bin/sh
pushd /local/backup/home/marki
rm -rf weekly.3
mv -v weekly.2 weekly.3
mv -v weekly.1 weekly.2
mv -v weekly.0 weekly.1
cp -al backup.0 weekly.0
exit
