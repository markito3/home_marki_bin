#!/bin/tcsh -f
echo starting job $1
$1  > & $1.tmp &
exit
