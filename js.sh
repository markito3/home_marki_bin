#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/jobstat.txt
temp_file=/tmp/jobstat.txt
rm -f $temp_file # just in case
date > $temp_file
/site/bin/jobstat -l -u all | /home/marki/bin/jobstat_cat.pl | /home/marki/bin/jobstat_filter.pl | sort -k 6,6r -k 1,1n >> $temp_file
rm -f $report_file
mv $temp_file $report_file
# end of shell script
