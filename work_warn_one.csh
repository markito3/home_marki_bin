#!/bin/tcsh -f
cd /work/clas/disk$1
find . -atime +6 -exec ls -lu {} \; | names.perl
exit
