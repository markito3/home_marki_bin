#!/usr/bin/env perl
$i = 0;
while (1) {
    $minutes = 2**$i;
    print "alarm.sh $minutes\n";
    system "alarm.sh $minutes";
    $total_minutes += $minutes;
    print "$total_minutes so far, more? <enter> = yes, n = no: ";
    $response = <STDIN>;
    if ($response =~ /n/) {exit;}
    $i++
}
