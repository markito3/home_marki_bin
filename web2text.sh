#!/bin/sh
rm -f $f
lynx -dump $url | grep -v edit] | grep -v action=edit | grep -v Visible\ links > $f
emacs $f
exit
