#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/silo_status.txt
rm -f $report_file
date > $report_file
/group/clas/tools/misc/silo_status.pl >> $report_file
# end of shell script
