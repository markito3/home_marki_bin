#!/usr/local/bin/perl

$pattern = shift(@ARGV); # pattern to search for
print "/pattern/=/$pattern/\n";
foreach $file (@ARGV) {
    print "file=$file\n";
    open(INPUT, $file); # open the file
    $nline = 0;
    $nmesg = 0;
    $match = 0;
    @message = ""; # clear array?
    while ($line = <INPUT>) {
	$nline++;
	if ($line =~ /^From /) {
	    $nmesg++;
	    if ($match) {PrintMessage();}
	    @message = "";
	    $match = 0;
	    print $line;
	} else {
	    push(@message, $line);
	    if ($line =~ /$pattern/) {$match = 1}
	}
    }
    if ($match) {PrintMessage();}
    print "nline=$nline\n";
    print "nmesg=$nmesg\n";
    close(INPUT);
}
exit 0;

sub PrintMessage {
    if (! @message) {return;}
    print "----------start of message-------------\n";
    print @message;
    print "----------end of message---------------\n";
    return;
}
