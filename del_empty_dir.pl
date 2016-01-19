#!/usr/bin/env perl
open (FIND, "find -type d |");
while (<FIND>) {
    chomp;
    $dir = $_;
    $dir =~ s/ /\\ /g;
    $dir =~ s/\(/\\\(/g;
    $dir =~ s/\)/\\\)/g;
    $dir =~ s/\'/\\\'/g;
    $dir =~ s/\&/\\\&/g;
    $dir =~ s/\"/\\\"/g;
#    print "====== dir = $dir =========\n";
    $count = `ls -a $dir | wc -l`;
    chomp $count;
    if ($count == 2) {
	system "rmdir -v $dir\n";
	}
}
