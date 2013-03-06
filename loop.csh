#!/bin/tcsh -f
set time=$argv[1]
echo loop time is $time seconds
shift
echo command is $*
set i=0
start:
    @ i = ( $i + 1 )
    date
    echo iteration = $i
    $*
    sleep $time
goto start
