#! /bin/tcsh -f
cd /work/clas/disk$1
rm -f $SCR/work_use_$1.tmp
find . -type f -exec ls -lu {} \; > $SCR/work_use_$1.tmp
work_use_sum.csh $1
exit
