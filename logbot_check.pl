#!/usr/bin/env perl
open (PS, "ps x |");
$n = 0;
while (<PS>) {
    if (/java org\/jibble\/logbot\/LogBotMain/) {
	$n++;
    }
}
if ($n == 0) {
    print "logbot not running\n";
}
exit 0;
