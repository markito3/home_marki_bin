#!/bin/sh
pushd /data/marki/backups/markdesk5/home/marki
rm -rf weekly.3
mv weekly.2 weekly.3
mv weekly.1 weekly.2
mv weekly.0 weekly.1
cp -al backup.0 weekly.0
exit
