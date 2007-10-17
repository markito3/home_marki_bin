# initialize the environment
setenv JANA_HOME /home/marki/jana/jana_svn_daily_linux
setenv OS `/bin/uname -s`
setenv ARCH `/bin/uname -p`
setenv OSNAME ${OS}-${ARCH}
setenv HALLD_HOME /home/marki/gluex
setenv JANA_CALIB_URL file:///home/marki/gluex/calib
setenv ROOTSYS /usr/local/src/root/prod
setenv XERCESCROOT /usr/local/xerces-c/prod
setenv XERCES_INCLUDE $XERCESCROOT/include
setenv LD_LIBRARY_PATH  $ROOTSYS/lib:$XERCESCROOT/lib
setenv CERN /usr/local/cernlib
setenv CERN_LEVEL 2006
setenv CERN_ROOT $CERN/$CERN_LEVEL
# extend path
eval `addpath.pl $ROOTSYS/bin $CERN_ROOT`
