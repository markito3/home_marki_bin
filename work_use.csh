#! /bin/tcsh -f
cd /work/clas/disk1
'rm' -f work_use.tmp
find . -exec ls -lud {} \; > work_use.tmp
cd /work/clas/disk2
'rm' -f work_use.tmp
find . -exec ls -lud {} \; > work_use.tmp
cd /work/clas/disk3
'rm' -f work_use.tmp
find . -exec ls -lud {} \; > work_use.tmp
'rm' -f work_tot.tmp
cat /work/clas/disk1/work_use.tmp /work/clas/disk2/work_use.tmp /work/clas/disk3/work_use.tmp > work_tot.tmp
'rm' -f work_tot_sort.tmp
sort -k 3 work_tot.tmp > work_tot_sort.tmp
'rm' work_summary.tmp
work_use.perl | sort -nrk 1 > work_summary.tmp
exit
