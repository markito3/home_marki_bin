#! /usr/bin/env perl
$max = $ARGV[0];
#print "max = $max\n";
$ranno = rand($max);
#print "ranno = $ranno\n";
$result = int($ranno) + 1;
print "$result\n";
exit;
