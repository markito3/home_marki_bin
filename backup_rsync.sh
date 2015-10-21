#!/bin/sh
rm -rf backup.3
mv backup.2 backup.3
mv backup.1 backup.2
cp -al backup.0 backup.1
rsync -ruvt --delete -e "ssh -i /home/marki/.ssh/renee_dsa" Renee@192.168.1.8:/home/Renee/ /scratch/backup_renee/backup.0/ --exclude AppData --exclude Music/ogg
exit
