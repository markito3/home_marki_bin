#!/bin/sh
i=0
while [ $i -lt 10 ]
do
    display /home/marki/misc/alarmclock.png &
    sleep 30
    i=$(( $i + 1 ))
done
exit
