#!/bin/bash
export SOFT=/group/halld/Software
export WEB=/group/halld/www/halldweb/html
export BUILD_SCRIPTS=$SOFT/build_scripts
export BMS_OSNAME=`$BUILD_SCRIPTS/osrelease.pl`
export GLUEX_TOP=$SOFT/builds/$BMS_OSNAME
source $BUILD_SCRIPTS/gluex_env_version.sh $WEB/dist/version_1.10.xml
pushd $GLUEX_TOP/sim-recon
make -f $BUILD_SCRIPTS/Makefile_sim-recon
