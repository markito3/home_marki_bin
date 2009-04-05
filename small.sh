#!/bin/sh
xrandr --output HDMI-1 --off
xrandr --output LVDS --auto
xrandr --size 1024x768
xrandr --size 1280x800
exit 0;
