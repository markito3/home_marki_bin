#!/bin/sh
backup_dir=/run/media/marki/Travel/marki/backups/markdesk6/home/marki
cd $backup_dir
rm -rf monthly.11
mv -v monthly.10 monthly.11
mv -v monthly.9 monthly.10
mv -v monthly.8 monthly.9
mv -v monthly.7 monthly.8
mv -v monthly.6 monthly.7
mv -v monthly.5 monthly.6
mv -v monthly.4 monthly.5
mv -v monthly.3 monthly.4
mv -v monthly.2 monthly.3
mv -v monthly.1 monthly.2
mv -v monthly.0 monthly.1
cp -al backup.0 monthly.0
exit
