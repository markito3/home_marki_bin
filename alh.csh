#!/bin/tcsh -f
source /apps/epics/setup/setup_epics
alh $APP/general/alh/gas.alhConfig >& /dev/null &
alh $APP/general/alh/hv.alhConfig >& /dev/null &
alh $APP/general/alh/vesda.alhConfig >& /dev/null &
exit
