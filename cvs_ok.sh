#!/bin/sh
cd $1
cd ..
pwd
cvs -n -q update
