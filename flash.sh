#!/bin/sh
i=0
while [ $i -lt 1 ]
do
    display /home/marki/misc/alarmclock.jpg &
    sleep 60
    i=$(( $i + 1 ))
done
exit
