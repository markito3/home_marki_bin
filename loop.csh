#!/bin/tcsh -f
set time=$argv[1]
echo loop time is $time seconds
shift
echo command is $*
start:
    $*
    sleep $time
goto start
