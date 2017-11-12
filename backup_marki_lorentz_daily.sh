#!/bin/sh
pushd /local/backup/home/marki
rm -rf daily.2
mv -v daily.1 daily.2
mv -v daily.0 daily.1
cp -al backup.0 daily.0
exit
