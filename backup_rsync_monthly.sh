#!/bin/sh
pushd /run/media/marki/New\ Volume/backup/renee
rm -rf monthly.3
mv -v monthly.2 monthly.3
mv -v monthly.1 monthly.2
mv -v monthly.0 monthly.1
cp -al backup.0 monthly.0
exit
