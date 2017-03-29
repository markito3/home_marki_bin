#!/bin/sh
pushd /run/media/marki/FantomHD/backup/renee
rm -rf backup.3
mv -v backup.2 backup.3
mv -v backup.1 backup.2
cp -al backup.0 backup.1
rsync -ruvt --delete -e "ssh -i /home/marki/.ssh/renee_rsa" Renee@192.168.1.166:/home/Renee/ backup.0/ --exclude AppData --exclude Music/ogg
exit