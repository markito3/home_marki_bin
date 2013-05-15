#!/bin/sh
seconds=$((60*$1))
/home/marki/bin/sleeper.pl $seconds
/home/marki/bin/flash.sh &
if [ -z $2 ]
    then
    xmms /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga > /dev/null &
fi
exit
