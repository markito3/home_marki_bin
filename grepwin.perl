#!/usr/local/bin/perl

$pattern = $ARGV[0];
$file = $ARGV[1];
print "$pattern $file\n";
$lenbuf = 9;
$indmatinc = 4;

open(INPUT, $file);
$ind = 0;
while ($line = <INPUT>) {
    print "line = $line";
    print "ind = $ind\n";
# put line in buffer at current buffer index
    $linebuf[$ind] = $line;
    print "linebuf[$ind] = $linebuf[$ind]";
    $indmat = $ind + $indmatinc;
    if ($indmat >= $lenbuf) {
	$indmat = $indmat - $lenbuf;
    }
    $linmat = $linebuf[$indmat];
    print "indmat = $indmat, linmat = $linmat";
# increment buffer pointer
    $ind++;
    if ($ind == $lenbuf) {
	$ind = 0;
    }
}

exit
