#!/usr/bin/env perl

$pattern = shift(@ARGV); # pattern to search for
print "/pattern/=/$pattern/\n";
foreach $file (@ARGV) {
    print "file=$file\n";
    print "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>\n";
    open(INPUT, $file); # open the file
    $nline = 0;
    $nmesg = 0;
    $match = 0;
    $preamble = 0;
    @info = "";
    @message = "";
    while ($line = <INPUT>) {
	$nline++;
	if ($line =~ /^From /) {
	    $nmesg++;
	    if ($match) {PrintMessage();}
	    $match = 0;
	    $preamble = 1;
	    @message = "";
	    @info = "";
	    #print "From line: $line";
	} elsif ($preamble) {
	    if ($line =~ /^Date: / || $line =~ /^From: / || $line =~ /^To: /
		|| $line =~ /^Subject: /) {
		if ($line =~ /$pattern/i) {$match = 1}
		push(@info, $line);
	    } elsif ($line eq "\n") {
		$preamble = 0;
	    }
	    #print "preamble: $line";
	} else {
	    push(@message, $line);
	    if ($line =~ /$pattern/i) {$match = 1}
	    #print "match=$match: $line";
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
    print @info;
    print "--------------------------start of message----------------------\n";
    print @message;
    print "---------------------------end of message-----------------------\n";
    print "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>\n";
    return;
}
