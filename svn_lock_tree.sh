#!/bin/sh
find $1 -path \*/.svn -prune -o \( -type f \) | grep -v .svn | perl -n -e 'chomp; $file = $_; $status = `svn st $file`; chomp $status; if ($status) {print "$file: non-blank status = $status\n"} else {print "$file: attempting lock\n"; system "svn lock $file";}'
exit
