#!/usr/bin/perl -w
#
use Getopt::Std;
$opt_x = -1; # supress warnings
$opt_y = -1;
$opt_r = 0;
$opt_d = 0;
getopts('x:y:dr');
$xcol = $opt_x;
$ycol = $opt_y;
$file1 = $ARGV[0];
$file2 = $ARGV[1];
open(ONE,"$file1");
open(TWO,"$file2");
open(DATA,">/tmp/float_diff_plot.txt");
open(GPLT,">/tmp/float_diff_plot.gplt");
$lineno = 0;
while($line1 = <ONE>) {
    $lineno++;
    @value1 = split(/\s+/, $line1);
    if ($line2 = <TWO>) {
	@value2 = split(/\s+/, $line2);
	if ($#value1 != $#value2) {
	    print "line $lineno: mismatch in number of values (minus one), $#value1, $#value2\n";
	    exit 2;
	}
	$nvalues = $#value1;
	if ($xcol > $nvalues) {
	    print "bad x column number\n";
	    exit 3;
	}
	if ($ycol > $nvalues) {
	    print "bad y column number\n";
	    exit 4;
	}
	$x1 = $value1[$xcol];
	$x2 = $value2[$xcol];
	if ($x1 != $x2) {
	    print "mismatch in x values: $x1, $x2\n";
	    exit 5;
	}
	$y1 = $value1[$ycol];
	$y2 = $value2[$ycol];
	if ($opt_d) {
	    if ($opt_r) {
		if ($y1 == 0) {
		    $diff = 0;
		} else {
		    $diff = ($y2 - $y1)/$y1;
		}
	    } else {
		$diff = $y2 - $y1;
	    }
	    print DATA "$x1 $diff\n";
	} else {
	    print DATA "$x1 $y1 $y2\n";
	}
    } else {
	print "file 2 shorter than file 1\n";
	exit 1;
    }
}
if ($opt_d) {
    print GPLT "plot \"/tmp/float_diff_plot.txt\" using 1:2\n";
} else {
    print GPLT "plot \"/tmp/float_diff_plot.txt\" using 1:2, \"/tmp/float_diff_plot.txt\" using 1:3\n";
}
print GPLT "load \"/home/marki/misc/save-png.gplt\"\n";
print GPLT "pause 300\n";

close(ONE);
close(TWO);
close(DATA);
close(GPLT);
system "gnuplot /tmp/float_diff_plot.gplt";
exit 0;
#
# end of perl script
