#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/cache_use.txt
temp_file=/tmp/cache_use.txt
rm -f $temp_file # just in case
date > $temp_file
/home/marki/bin/cache_use.pl >> $temp_file
mv $temp_file $report_file
# end of shell script
