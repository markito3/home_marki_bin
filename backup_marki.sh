#!/bin/bash
rm -f /home/marki/date.txt
date > /home/marki/date.txt
cd /data/marki/backups/markdesk5/home/marki
rm -rf backup.11
mv backup.10 backup.11
mv backup.9 backup.10
mv backup.8 backup.9
mv backup.7 backup.8
mv backup.6 backup.7
mv backup.5 backup.6
mv backup.4 backup.5
mv backup.3 backup.4
mv backup.2 backup.3
mv backup.1 backup.2
cp -al backup.0 backup.1
rsync -rutl --delete --exclude-from=/home/marki/bin/backup_exclude.txt /home/marki/ /data/marki/backups/markdesk5/home/marki/backup.0/
