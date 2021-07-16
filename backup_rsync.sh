#!/bin/sh
ip=192.168.1.225
backup_dir=/data/renee/backups/markdesk4
test -d $backup_dir || exit 1
cd $backup_dir
rm -rf backup.5
mv backup.4 backup.5
mv backup.3 backup.4
mv backup.2 backup.3
mv backup.1 backup.2
cp -al backup.0 backup.1
ssh -i /home/marki/.ssh/renee_rsa reneeito@$ip date \> backup_date
rsync -ruvt --delete -e "ssh -i /home/marki/.ssh/renee_rsa" \
      reneeito@${ip}:/home/reneeito/ backup.0/ --exclude .cache \
      --exclude .local/share/gvfs-metadata --exclude .local/share \
      --exclude Dropbox/.dropbox.cache --exclude .dropbox --exclude .mozilla \
      --exclude .dropbox-dist \
    | grep -v "receiving incremental file list" \
    | grep -v "skipping non-regular file " | grep -v " bytes/sec" \
    | grep -v " speedup is " \
    | grep -v "backup_date"
exit
