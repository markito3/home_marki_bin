#!/bin/bash
cd /data/marki/backups/markdesk5/home/marki
rm -rf daily.6
mv daily.5 daily.6
mv daily.4 daily.5
mv daily.3 daily.4
mv daily.2 daily.3
mv daily.1 daily.2
mv daily.0 daily.1
cp -al backup.0 daily.0
exit
