#!/bin/tcsh
rm -f $SCR/work_use.log
work_use.csh >& $SCR/work_use.log
cp $SCR/work_report.tmp /home/marki/public_html/clas/work_report.txt
exit
