# initialize the environment
setenv JANA_HOME /usr/local/jana/prod
setenv OS `/bin/uname -s`
setenv ARCH `/bin/uname -p`
setenv OSNAME ${OS}-${ARCH}
setenv HALLD_HOME /usr/local/halld/prod
setenv JANA_CALIB_URL file:///home/marki/gluex/calib
setenv ROOTSYS /usr/local/root/prod
setenv XERCESCROOT /usr/local/xerces-c/prod
setenv XERCES_INCLUDE $XERCESCROOT/include
setenv LD_LIBRARY_PATH  $ROOTSYS/lib:$XERCESCROOT/lib
setenv CERN /usr/local/cernlib
setenv CERN_LEVEL 2006
setenv CERN_ROOT $CERN/$CERN_LEVEL
setenv HALLD_MY /scratch/${USER}/halld_my
# extend path
eval `addpath.pl $ROOTSYS/bin $CERN_ROOT`
