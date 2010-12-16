#!/bin/sh
seconds=$((60*$1))
sleeper.pl $seconds
display /home/marki/misc/alarmclock.png &
xmms /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga > /dev/null &
exit
