#!/bin/tcsh -f
start:
    $argv[1]
    sleep $argv[2]
goto start
