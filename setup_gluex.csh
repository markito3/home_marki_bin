setenv GLUEX_TOP /home/gluex
setenv CLHEP $GLUEX_TOP/clhep/prod
source /home/marki/bin/setup_clhep.csh
setenv GSL $GLUEX_TOP/gsl/prod
source /home/marki/bin/gsl_env.csh
if (! $?HALLD_MY) setenv HALLD_MY /scratch/marki/halld_my
source /home/marki/halld/build_scripts/gluex_env.csh
eval `addpath.pl $HALLD_MY/bin/$BMS_OSNAME`
