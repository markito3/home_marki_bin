#!/bin/tcsh -f
cd /work/clas/disk$1
find . -atime +2 -exec ls -lu {} \; | names.perl
exit
