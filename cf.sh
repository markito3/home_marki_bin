#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/cache_files.txt
rm -f $report_file
date > $report_file
/group/clas/tools/misc/cache_files.pl >> $report_file
# end of shell script