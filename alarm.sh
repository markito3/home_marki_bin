#!/bin/sh
seconds=$((60*$1))
/home/marki/bin/sleeper.pl $seconds
flash.sh &
if [ -z $2 ]
    then
    xmms /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null &
    sleep 1
    xmms /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null &
    sleep 1
    xmms /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null &
fi
exit
