#!/bin/bash
cd /
ftmt -f /dev/nqft0 rewind
sleep 30
echo taring /
tar lzcf /dev/nqft0 .
sleep 30
echo taring /usr
tar lzcf /dev/nqft0 ./usr
sleep 30
echo taring /usr/local
tar lzcf /dev/nqft0 ./usr/local
sleep 30
echo taring /home
tar lzcf /dev/nqft0 --exclude ./home/scratch ./home
sleep 30
ftmt -f /dev/nqft0 status
sleep 30
ftmt -f /dev/nqft0 rewind
exit
