#!/bin/tcsh -f
set time=$argv[1]
echo loop time is $time seconds
shift
echo command is $*
start:
    date
    $*
    sleep $time
goto start
