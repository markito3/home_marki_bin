#!/usr/bin/env perl
$i = 0;
while (1) {
    $minutes = 2**$i;
    print "go\n";
    system "alarm.sh $minutes";
    $total_minutes += $minutes;
    $next_minutes = 2**($i + 1);
    print "$total_minutes so far, $next_minutes more? <enter> = yes, n = no: ";
    $response = <STDIN>;
    if ($response =~ /n/) {exit;}
    $i++
}
