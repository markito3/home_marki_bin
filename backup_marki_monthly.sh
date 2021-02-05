#!/bin/sh
pushd /data/marki/backups/markdesk5/home/marki
rm -rf monthly.5
mv -v monthly.4 monthly.5
mv -v monthly.3 monthly.4
mv -v monthly.2 monthly.3
mv -v monthly.1 monthly.2
mv -v monthly.0 monthly.1
cp -al backup.0 monthly.0
exit
