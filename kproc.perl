#!/usr/local/bin/perl
open (PS,"ps -u marki |");
while (<PS>) {
    chop;
    @field = split(/\s+/,$_);
#    print "@field\n";
    if ($field[4] eq $ARGV[0]) {
	print "killing process: $_ \n";
	system("kill -9 $field[1]");
	exit;
    }
}
print "nothing found to kill\n";
