#!/bin/sh
i=0
while [ $i -lt 3 ]
do
    display /home/marki/misc/alarmclock.png &
    sleep 60
    i=$(( $i + 1 ))
done
exit
