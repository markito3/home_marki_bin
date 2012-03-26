#!/bin/sh
i=1
while [ $i -le 3 ]
do
    display /home/marki/misc/alarmclock.png &
    sleep 30
    i=$(( $i + 1 ))
done
exit
