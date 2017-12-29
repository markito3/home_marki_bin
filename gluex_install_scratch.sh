#!/bin/bash
pushd $1
mkdir -pv gluex_install_scratch
pushd gluex_install_scratch
day=`date +%u`
rm -rf $day
mkdir -pv $day
pushd $day
/home/marki/gluex_install/gluex_install.sh
