#!/usr/bin/env perl
open (FIND, "find $ARGV[0] -type d -user $ARGV[1] |");
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
	print "$dir\n";
	}
}
