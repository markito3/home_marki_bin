#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/cache_files.txt
temp_file=$webdir/cache_files.tmp
rm -f $temp_file
date > $temp_file
/group/clas/tools/misc/cache_files.pl >> $temp_file
mv $temp_file $report_file
# end of shell script
