#!/bin/tcsh -f
source /apps/epics/setup/setup_epics
alh $APP/general/alh/gas.alhConfig &
sleep 5
alh $APP/general/alh/hv.alhConfig &
sleep 5
alh $APP/general/alh/vesda.alhConfig &
sleep 5
exit
