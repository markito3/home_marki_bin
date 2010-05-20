#!/bin/sh
seconds=$((60*$1))
sleep $seconds
totem /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
exit
