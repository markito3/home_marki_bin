#!/usr/local/bin/perl
$nline = 5;
$iline = 3;
$ptr = 0;
while ($line[$ptr] = <STDIN>) {
    $chk = $ptr - ($nline - $iline);
    if ($chk < 0) {$chk = $chk + $nline;}
    if ($line[$chk] =~ /$ARGV[0]/i) {
	$prtstr = $ptr - $nline + 1;
	for ($prt = 0; $prt < $nline; $prt++) {
	    $prtptr = $prtstr + $prt;
	    if ($prtptr < 0) {$prtptr = $prtptr + $nline;}
	    print $line[$prtptr];
	}
	print "------------------\n";
    }
    $ptr++;
    if ($ptr == $nline) {$ptr = 0;}
}
exit
