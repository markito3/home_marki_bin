#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/farmqueues.txt
rm -f $report_file
date > $report_file
/site/bin/farmqueues >> $report_file
for queue in priority production jcache low_priority idle FARM_TEST
    do /site/bin/farmqueues -l -r $queue \
	| grep -v ' 0        0         0.0        0' >> $report_file
done
# end of shell script
