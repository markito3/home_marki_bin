#!/bin/sh
echo remote node: $1
ssh $1 who
exit
