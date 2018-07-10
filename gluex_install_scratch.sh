#!/bin/bash
pushd $1
mkdir -pv gluex_install_scratch
pushd gluex_install_scratch
day=`date +%j`
logfile=gluex_install_${day}.log
rm -rf $day
mkdir -pv $day
pushd $day
echo installing in `pwd`
echo log file is $logfile
/home/marki/gluex_install/gluex_install.sh >& $logfile
