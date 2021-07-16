#!/bin/sh
cd /data/renee/backups/markdesk4
rm -rf monthly.6
mv -v monthly.5 monthly.6
mv -v monthly.4 monthly.5
mv -v monthly.3 monthly.4
mv -v monthly.2 monthly.3
mv -v monthly.1 monthly.2
mv -v monthly.0 monthly.1
cp -al backup.0 monthly.0
exit
