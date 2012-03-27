#!/bin/sh
i=1
while [ $i -le 5 ]
do
    display /home/marki/misc/alarmclock.png &
    sleep 60
    i=$(( $i + 1 ))
done
exit
