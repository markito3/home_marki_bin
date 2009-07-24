setenv GLUEX_TOP /home/gluex
setenv CLHEP $GLUEX_TOP/clhep/prod
source /home/marki/bin/setup_clhep.csh
setenv HALLD_MY /scratch/marki/halld_my
source /home/marki/halld/build_scripts/gluex_env.csh
eval `addpath.pl $HALLD_MY/bin/$BMS_OSNAME`
