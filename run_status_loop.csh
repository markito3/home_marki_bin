#! /bin/tcsh -f
start:
    date
    ssh clon00 -l clasrun /usr/local/clas/bin/run_status
    sleep 120
    goto start
