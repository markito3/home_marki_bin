#!/bin/sh
cd /data/renee/backups/markdesk4
rm -rf weekly.4
mv -v weekly.3 weekly.4
mv -v weekly.2 weekly.3
mv -v weekly.1 weekly.2
mv -v weekly.0 weekly.1
cp -al backup.0 weekly.0
exit
