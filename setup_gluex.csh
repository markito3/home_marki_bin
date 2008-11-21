setenv HALLD_MY /scratch/marki/halld_my_`date_fixed.pl`
source /home/marki/bin/clhep_env.csh
setenv GLUEX_TOP /usr/local
source /home/marki/halld/build_scripts/gluex_env.csh
eval `addpath.pl $HALLD_MY/bin/$BMS_OSNAME`
