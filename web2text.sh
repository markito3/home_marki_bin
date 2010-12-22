#!/bin/sh
f=$1
url=$2
rm -f $f
lynx -dump $url | grep -v edit] | grep -v action=edit | grep -v Visible\ links > $f
emacs $f
echo $f
exit

