#!/bin/tcsh -f
# does a find starting from a dir and greps all resulting files for a string
set dir=$1
set string=$2
find $dir -exec grep -i $string {} \; -exec echo ^^^ found in file: \; \
    -print -exec echo ====================== \;
exit
