#! /bin/tcsh -f
find $1 -type f -exec ls -l {} \; | \
sort -k 3 | \
work_use.perl | \
sort -nrk 1
exit
