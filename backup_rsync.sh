#!/bin/sh
ip=192.168.1.195
pushd /run/media/marki/Travel/backup/renee
rm -rf backup.6
mv -v backup.5 backup.6
mv -v backup.4 backup.5
mv -v backup.3 backup.4
mv -v backup.2 backup.3
mv -v backup.1 backup.2
cp -al backup.0 backup.1
ssh -i /home/marki/.ssh/renee_rsa renee@$ip date \> backup_date
rsync -ruvt --delete -e "ssh -i /home/marki/.ssh/renee_rsa" \
      renee@${ip}:/home/renee/ backup.0/ --exclude .cache --exclude .config \
      --exclude .local/share/Steam --exclude .mozilla --exclude .steam \
      --exclude .local/share/gvfs-metadata --exclude .local/share/tracker --exclude Music --exclude Dropbox/.dropbox.cache
exit
