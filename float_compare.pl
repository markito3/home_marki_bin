#!/usr/bin/perl -w
#
$fracdiffcut = 0.00001;
#
$file1 = $ARGV[0];
$file2 = $ARGV[1];
open(ONE,"$file1");
open(TWO,"$file2");
$lineno = 0;
while($line1 = <ONE>) {
    $lineno++;
    @value1 = split(/\s+/, $line1);
    if ($line2 = <TWO>) {
	@value2 = split(/\s+/, $line2);
	if ($#value1 != $#value2) {
	    print "line $lineno: mismatch in number of values (minus one), $#value1, $#value2\n";
	}
	if ($#value1 < $#value2) {
	    $nvalues = $#value1;
	} else {
	    $nvalues = $#value2;
	}
	for ($i = 0; $i <= $nvalues; $i++) {
	    $v1 = $value1[$i];
	    $v2 = $value2[$i];
	    if ($v1 + $v2 != 0.0) {
		$fracdiff = 2.0*($v2 - $v1)/($v1 + $v2);
		if (abs($fracdiff) > $fracdiffcut) {
		    print "$lineno, $i, $v1, $v2, $fracdiff\n";
		}
	    } else {
		if ($v1 != 0.0) {
		    print "$lineno, $i, $v1, $v2, average value is zero\n";
		}
	    }
	}
    } else {
	print "file 2 shorter than file 1\n";
	exit 1;
    }
}
close(ONE);
close(TWO);
exit 0;
# end of perl script
