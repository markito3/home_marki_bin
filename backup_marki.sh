#!/bin/sh
pushd /scratch/backup_marki
rm -rf backup.3
mv -v backup.2 backup.3
mv -v backup.1 backup.2
cp -al backup.0 backup.1
rsync -ruvt --delete /home/marki/ backup.0/ --exclude Music --exclude Renees_pictures.zip --exclude .cache --exclude .local/share/Trash --exclude .recoll/xapiandb --exclude .thunderbird/7ao3ph9q.default/ImapMail/zmail.jlab.org/mail.sbd --exclude Dropbox
exit
