#!/bin/sh
tempfile=/tmp/jobstat.tmp
rm -f $tempfile
jobstat > $tempfile
queued=`grep -v JOBID $tempfile | wc -l`
dependent=`grep PSUSP $tempfile | wc -l`
pending=`grep PEND $tempfile | wc -l`
running=`grep RUN $tempfile | wc -l`
echo queued: $queued, dependent: $dependent, pending: $pending, running: $running
rm -f $tempfile
exit
