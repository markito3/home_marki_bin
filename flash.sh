#!/bin/sh
i=0
while [ $i -lt 10 ]
do
    display /home/marki/misc/alarmclock.jpg &
    sleep 60
    i=$(( $i + 1 ))
done
exit
