#!/usr/local/bin/perl

$pattern = shift(@ARGV); # pattern to search for
print "/pattern/=/$pattern/\n";
foreach $file (@ARGV) {
    print "file=$file\n";
    open(INPUT, $file); # open the file
    $nline = 0;
    $nmesg = 0;
    while ($line = <INPUT>) {
	$nline++;
	if ($line =~ /^From /) {
	    $nmesg++;
	    print $line;
	}
    }
    print "nline=$nline\n";
    print "nmesg=$nmesg\n";
    close(INPUT);
}
exit 0;
