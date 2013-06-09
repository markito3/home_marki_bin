#!/bin/sh
find -type d | perl -n -e 'chomp; $dir = $_; $dir =~ s/ /\\ /g; $dir =~ s/\(/\\\(/g; $dir =~ s/\)/\\\)/g; $count = `ls -a $dir | wc -l`; chomp $count; if ($count == 2) {system "rmdir -v $dir";}'
