#! /bin/sh
workdir=/work/clas/disk3/claslib/calib_backup
date=`date_fixed.pl`
filename="calib_dump_$date.sql.gz"
test -d $workdir || mkdir -p $workdir
mysqldump -h clasdb.jlab.org -u clasuser calib | gzip -c > $workdir/$filename
# end of shell script
