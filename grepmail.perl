#!/usr/local/bin/perl

$pattern = $ARGV[0]; # pattern to search for
$file = $ARGV[1]; # file to search in
#print "$pattern $file\n";
$lenbuf = 20; # number of lines to print
$indmatinc = 10; # number of line with match, c. f. 1

for ($i=0; $i < $lenbuf; $i++) { # init buffer
    $linebuf[$i] = "beginning of file\n"
}

open(INPUT, $file); # open the file
$ind = 0; # initialize buffer pointer
$more = 1; # loop logical
$nbeyond = 0; # beyond the end of file counter
while ($more) { # go
    if (!($line = <INPUT>)) { # if no more lines in file
	$line = "end of file\n"; # fake line to flush the buffer
	$nbeyond++;
	if ($nbeyond > $lenbuf - $indmatinc) {$more = 0} # enough flushing
    }
    #print "line = $line";
    #print "ind = $ind\n";
# check for "From " line. If this is one, save it in a buffer
    if ($line =~ /^From /) {$line_from_buffer = $line;}
# check new line for match. If there is one, promote from line in buffer to
# $line_from
    if ($line =~ /$pattern/i) {$line_from = $line_from_buffer;}
# put line in buffer at current buffer index
    $linebuf[$ind] = $line;
    #print "linebuf[$ind] = $linebuf[$ind]";
    $indmat = $ind - ($lenbuf - $indmatinc); # index of line to check for match
    if ($indmat < 0) {
	$indmat += $lenbuf; # wrap it around
    }
    $linmat = $linebuf[$indmat]; # get the line to search
    #print "indmat = $indmat, linmat = $linmat";
    if ($linmat =~ /$pattern/i) {
	#print "match found\n";
	print $line_from;
	for ($i = 0; $i < $lenbuf; $i++) { # print the buffer
	    $indprt = $i + $indmat - ($indmatinc - 1); # set printing index
	    if ($indprt >= $lenbuf) {
		$indprt -= $lenbuf; # wrap around
	    }
	    #print "i = $i, indprt = $indprt\n";
	    print $linebuf[$indprt];
	}
	print "----------------------------------------\n"; # print a separator
    }
# increment buffer pointer
    $ind++;
    if ($ind == $lenbuf) {
	$ind = 0; # wrap around
    }
}

exit
