#!/bin/tcsh -f
cd /work/clas/disk$1
find . -type f -atime +4 -exec ls -lu {} \; | names.perl
exit
