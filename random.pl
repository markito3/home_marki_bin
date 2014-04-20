#! /usr/bin/env perl
$max = $ARGV[0];
if ($ARGV[1]) {
    $offset = $ARGV[1];
} else {
    $offset = 0;
}
#print "max = $max\n";
$ranno = rand($max);
#print "ranno = $ranno\n";
$result = int($ranno) + $offset + 1;
print "$result\n";
exit;
