#!/usr/bin/env perl
$total_size = 0;
while ($file = <STDIN>) {
    #print $file;
    chop $file;
    $size = -s $file;
    $total_size += $size;
    #print "size=$size total_size=$total_size\n";
}
print "$total_size\n";
exit 0;
