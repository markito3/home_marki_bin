#!/bin/tcsh
work_idle.pl /work/clas/disk1 header
work_idle.pl /work/clas/disk2
work_idle.pl /work/clas/disk3
work_idle.pl /work/clas/calib
work_idle.pl /work/clas/gsim
work_idle.pl /work/clas/physana
work_idle.pl /work/clas/production
work_idle.pl /work/clas/production2
work_idle.pl /work/clas/farm_output
echo ""
echo "all sizes are in gigabytes"
echo "size: total size of partition"
echo "used: used space"
echo "stale: sum of sizes of files unaccessed in 14 days"
echo "free: free space"
exit
