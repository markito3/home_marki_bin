#!/usr/local/bin/perl
print "diffs with $ARGV[0] \n";
open (LS,"ls |");
open (LOG,">/tmp/difdir.tmp");
while (<LS>) {
    chop;
    if (-T) {
	print LOG "\n_____________", $_, "____________\n";
	print LOG `diff $_ $ARGV[0]`;
    }
}
