#!/usr/bin/env perl
$i = 0;
while (1) {
    $minutes = 2**$i;
    system "alarm.sh $minutes 1";
    $total_minutes += $minutes;
    $next_minutes = 2**($i + 1);
    print "\n$total_minutes so far, $next_minutes more? <enter> = yes, n = no: ";
    $response = <STDIN>;
    if ($response =~ /n/) {exit;}
    $i++
}
