#!/bin/sh
cd /data/renee/backups/reneepc
rm -rf daily.6
mv -v daily.5 daily.6
mv -v daily.4 daily.5
mv -v daily.3 daily.4
mv -v daily.2 daily.3
mv -v daily.1 daily.2
mv -v daily.0 daily.1
cp -al backup.0 daily.0
exit
