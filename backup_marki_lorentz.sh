#!/bin/sh
pushd /local/backup/home/marki
rm -rf backup.3
mv -v backup.2 backup.3
mv -v backup.1 backup.2
cp -al backup.0 backup.1
rm -fv /home/marki/backup_timestamp.txt
date > /home/marki/backup_timestamp.txt
cat /home/marki/backup_timestamp.txt
rsync -ruvt --delete /home/marki/ backup.0/ --exclude .cache --exclude .local/share/Trash --exclude .recoll/xapiandb --exclude .thunderbird --exclude Dropbox --exclude .local/share/gnome-boxes --exclude VirtualBox\ VMs --exclude google_drive --exclude iso --exclude .config/google-chrome | grep -v "skipping non-regular file"
rm -v /home/marki/backup_timestamp.txt
exit
