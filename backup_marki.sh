#!/bin/bash
pushd /data/marki/backups/markdesk5/home/marki
rm -rf backup.11
mv -v backup.10 backup.11
mv -v backup.9 backup.10
mv -v backup.8 backup.9
mv -v backup.7 backup.8
mv -v backup.6 backup.7
mv -v backup.5 backup.6
mv -v backup.4 backup.5
mv -v backup.3 backup.4
mv -v backup.2 backup.3
mv -v backup.1 backup.2
cp -al backup.0 backup.1
rsync -ruvtl --delete /home/marki/ /data/marki/backups/markdesk5/home/marki/backup.0/
