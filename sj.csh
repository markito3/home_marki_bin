#!/bin/tcsh
rm -f $1.tmp
echo starting job $1
$1  > & $1.tmp &
exit
