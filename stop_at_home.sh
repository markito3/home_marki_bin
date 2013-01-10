#!/bin/sh
echo stop gnote
ssh -n $HOUSE kproc.pl gnote 1
echo stop empathy
ssh -n $HOUSE kproc.pl empathy 1

