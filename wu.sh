#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/work_usage.txt
temp_file=/tmp/work_usage.txt
rm -f $temp_file # just in case
date > $temp_file
echo >> $temp_file
df /work/clas/disk1 /work/clas/disk2 /work/clas/disk3 /work/clas/farm_output >> $temp_file
echo >> $temp_file
/home/marki/bin/work_db.pl >> $temp_file
rm -f $report_file
mv $temp_file $report_file
# end of shell script
