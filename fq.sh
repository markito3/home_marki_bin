#! /bin/sh
webdir=/home/marki/public_html/clas
report_file=$webdir/farmqueues.txt
rm -f $report_file
date > $report_file
/site/bin/farmqueues -l -r production \
    | grep -v ' 0        0         0.0        0' >> $report_file
# end of shell script
