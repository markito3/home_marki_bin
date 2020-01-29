#!/bin/bash
ps -fu$USER | grep -v grep | grep "emacs --daemon"
status=$?
echo status = $status
if [ $status -eq 0 ]
    then
    echo daemon running
else
    echo daemon not running
    emacs --daemon
fi
if [ "$1" = "-r" ]
    then
    echo 1 = $1, 2 = $2
    lisp="'(view-file \""$2"\")'"
    echo lisp = $lisp
    emacsclient --create-frame --eval "$lisp"
else
    emacsclient --create-frame $1 &
fi
exit


