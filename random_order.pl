#! /usr/bin/env perl
$max = $ARGV[0];
#print "max = $max\n";
for $i (1 .. $max) {
    $open[$i] = 1;
}
for $j (1 .. $max) {
    $max_this = $max - $j + 1;
    $ranno = rand($max_this);
    $result = int($ranno) + 1;
    #print "j = $j, max_this = $max_this, ranno = $ranno, result = $result\n";
    $nopen = 0;
    $index = 0;
    while ($nopen < $result) {
	if ($open[++$index]) {
	    $nopen++;
	}
    }
    print "$index\n";
    $open[$index] = 0;
}
exit;
