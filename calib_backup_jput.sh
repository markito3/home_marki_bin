#! /bin/sh
workdir=/work/clas/disk3/claslib/calib_backup
mssdir=/mss/clas/caldb
#mssdir=/mss/clas/tmp2
date=`date_fixed.pl`
filename="calib_dump_$date.sql.gz"
cd $workdir
jput $workdir/$filename $mssdir
# end of shell script
