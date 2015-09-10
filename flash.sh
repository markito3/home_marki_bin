#!/bin/sh
i=0
while [ $i -lt 1 ]
do
    display /home/marki/misc/alarmclock.jpg &
    sleep 180
    i=$(( $i + 1 ))
done
exit
