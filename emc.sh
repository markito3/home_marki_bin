#!/bin/bash
ps -fu$USER | grep -v grep | grep "emacs --daemon"
echo status = $?
if [ $? -eq 0 ]
    then
    echo daemon running
else
    echo daemon not running
    emacs --daemon
fi
emacsclient -c $1 &
exit


