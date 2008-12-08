#!/bin/sh
test -d /scratch/nightly_new || mkdir -p /scratch/nightly_new
cd /scratch/nightly_new
#svn co svn+ssh://jlabl3.jlab.org/group/halld/Repositories/svnroot/trunk/scripts/build_scripts
svn co https://halldsvn.jlab.org/repos/trunk/scripts/build_scripts
export BUILD_SCRIPTS=`pwd`/build_scripts
csh -c 'source build_scripts/gluex_env.csh ; make -f $BUILD_SCRIPTS/Makefile_all' > make.log
test -d /scratch/nightly || mv -v /scratch/nightly /scratch/nightly_old
mv -v /scratch/nightly_new /scratch/nightly
