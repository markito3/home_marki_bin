mkdir jana
cd jana
wget http://www.jlab.org/JANA/releases/jana_svn_daily_linux.tgz
tar zxvf jana_svn_daily_linux.tgz
cd jana_svn_daily_linux
setenv JANA_HOME $cwd
rm -rf bin lib include
cd src/JANA
setenv OS `/bin/uname -s`
setenv ARCH `/bin/uname -p`
setenv OSNAME ${OS}-${ARCH}
make clean
make
make install
cd ../../../..
mkdir gluex
cd gluex
svn checkout https://halldsvn.jlab.org/repos/trunk/src
setenv HALLD_HOME $cwd
cd src
setenv ROOTSYS /usr/local/src/root/prod
eval `addpath.pl $ROOTSYS/bin`
setenv XERCESCROOT /usr/local/xerces-c/prod
setenv XERCES_INCLUDE $XERCESCROOT/include
setenv LD_LIBRARY_PATH  $ROOTSYS/lib:$XERCESCROOT/lib
setenv CERN /usr/local/cernlib
setenv CERN_LEVEL 2006
make FC=gfortran DFC=gfortran
cd ../..
echo gulex_build.csh done
