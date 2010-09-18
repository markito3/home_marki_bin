#!/bin/sh
seconds=$((60*$1))
sleep $seconds
xmms /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga > /dev/null
exit
