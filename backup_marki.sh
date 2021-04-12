#!/bin/bash
rm -f /home/marki/date.txt
date > /home/marki/date.txt
cd /data/marki/backups/markdesk5/home/marki
rm -rf backup.23
mv backup.22 backup.23
mv backup.21 backup.22
mv backup.20 backup.21
mv backup.19 backup.20
mv backup.18 backup.19
mv backup.17 backup.18
mv backup.16 backup.17
mv backup.15 backup.16
mv backup.14 backup.15
mv backup.13 backup.14
mv backup.12 backup.13
mv backup.11 backup.12
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
