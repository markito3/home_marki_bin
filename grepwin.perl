#!/usr/local/bin/perl

$pattern = $ARGV[0];
$file = $ARGV[1];
#print "$pattern $file\n";
$lenbuf = 9;
$indmatinc = 4;

open(INPUT, $file);
$ind = 0;
while ($line = <INPUT>) {
    #print "line = $line";
    #print "ind = $ind\n";
# put line in buffer at current buffer index
    $linebuf[$ind] = $line;
    #print "linebuf[$ind] = $linebuf[$ind]";
    $indmat = $ind - $lenbuf + $indmatinc;
    if ($indmat < 0) {
	$indmat += $lenbuf;
    }
    $linmat = $linebuf[$indmat];
    #print "indmat = $indmat, linmat = $linmat";
    if ($linmat =~ /$pattern/i) {
	#print "match found\n";
	for ($i = 0; $i < $lenbuf; $i++) {
	    $indprt = $i + $indmat - $indmatinc + 1;
	    if ($indprt < 0) {$indprt += $lenbuf}
	    if ($indprt >= $lenbuf) {$indprt -= $lenbuf}
	    #print "i = $i, indprt = $indprt\n";
	    print $linebuf[$indprt];
	}
	print "-------------------------\n";
    }
# increment buffer pointer
    $ind++;
    if ($ind == $lenbuf) {
	$ind = 0;
    }
}

exit
