#!/usr/bin/env perl
$i = 0;
$total_minutes = 0;
while (1) {
    $minutes = 2**$i;
    system "/home/marki/bin/alarm.sh $minutes";
    $total_minutes += $minutes;
    $next_minutes = 2**($i + 1);
    print "\n$total_minutes so far, $next_minutes more? <enter> = yes, n = no: ";
    $response = <STDIN>;
    if ($response =~ /n/) {exit;}
    system "kproc.pl flash.sh 1 0 1";
    system "kproc.pl alarmclock.png 1 0 1";
    system "kproc.pl alarm-clock-elapsed.oga 1 0 1";
    $i++
}
