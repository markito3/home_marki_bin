#!/usr/bin/env perl
#pops the Campbell's Tomato Soup Can when the network comes alive
$success = 0;
while (!$success) {
    open (PING, "ping -c 1 129.57.32.1 |");
    while (<PING>) {
	print;
	if (/time=/) {
	    print "ok\n";
	    $success = 1;
	}
    }
}
system "xv /home/marki/misc/soup.gif";
exit
