#!/bin/sh
seconds=$((60*$1))
sleep $seconds
xterm -e bell.sh
eog /home/marki/misc/alarmclock.png
exit
