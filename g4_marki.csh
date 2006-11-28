setenv G4WORKDIR $SCR/g4work
source /usr/local/geant4/prod/.config/bin/Linux-g++/env.csh
setenv XERCESCROOT /usr/local/xerces/xerces-c-src_2_7_0
if ($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH /usr/local/clhep/prod/lib:$XERCESCROOT/lib:$LD_LIBRARY_PATH
else
    setenv LD_LIBRARY_PATH /usr/local/clhep/prod/lib:$XERCESCROOT/lib
endif
eval `addpath.pl /usr/local/java/jdk1.5.0_07/bin`
eval `addpath.pl -e /usr/local/wired/bin`
