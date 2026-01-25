#!/bin/bash
backup_dir=/data/renee/backups/reneepc
test -d $backup_dir || exit 1
cd $backup_dir
rm -rf backup.5
mv backup.4 backup.5
mv backup.3 backup.4
mv backup.2 backup.3
mv backup.1 backup.2
cp -al backup.0 backup.1
ssh -i /home/marki/.ssh/renee_ecdsa renee@reneepc.fios-router.home date \>\| backup_date
rsync -ruvt --delete -e "ssh -i /home/marki/.ssh/renee_ecdsa" \
      renee@reneepc.fios-router.home:/home/renee/ backup.0/ \
      --exclude AppData
exit
