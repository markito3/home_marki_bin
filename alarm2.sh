#!/bin/sh
seconds=$((60*$1))
/home/marki/bin/sleeper.pl $seconds
/home/marki/bin/flash.sh &
if [ -z $2 ]
then
    xmms2 clear
    xmms2 add /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
    xmms2 play
    xmms2 clear
fi
exit
