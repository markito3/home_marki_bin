#!/bin/sh
PATH=/home/marki/bin:$PATH
export PATH
webdir=/home/marki/public_html/clas
report_file=$webdir/work_idle.txt
tempfile=/tmp/work_idle.tmp
rm -f $tempfile
date > $tempfile
echo >> $tempfile
( work_idle.csh >> $tempfile ) >& /dev/null
mv $tempfile $report_file
exit
