#!/usr/local/bin/perl
#open (PS,"ps -u marki |");
open (PS,"ps xwww |");
while ($line=<PS>) {
    chop $line;
    $line = " ".$line;
    @field = split(/\s+/,$line);
#    print "@field\n";
    if ($field[5] eq $ARGV[0]) {
	print "killing process: $line\n";
	system("kill -9 $field[1]");
	exit;
    }
}
print "nothing found to kill\n";
