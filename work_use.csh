#! /bin/tcsh -f
cd /work/clas/disk3
'rm' -f work_use*.tmp
find . -exec ls -ld {} \; > work_use.tmp
sort -k 3 work_use.tmp > work_use_2.tmp
exit
