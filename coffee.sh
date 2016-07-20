#!/bin/sh
seconds=$((60*5))
sleep $seconds
xmms /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga > /dev/null &
display /home/marki/misc/ist2153798coffeecupoe6.jpg
kproc.pl alarm-clock-elapsed 1
exit
