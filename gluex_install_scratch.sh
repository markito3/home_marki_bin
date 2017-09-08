#!/bin/bash
pushd /u/scratch/marki
mkdir -pv gluex_install_scratch
pushd gluex_install_scratch
day=`date +%u`
rm -rf $day
mkdir -pv $day
pushd $day
/home/marki/gluex_install/gluex_install.sh
