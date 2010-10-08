#!/usr/bin/perl
open(IN, "/home/marki/Desktop/ts.txt");
while (<IN>) {
    #print;
    chomp;
    split /,/;
    $month = $_[0];
    $day = $_[1];
    if ($day != $day_last) {
	write_day_summary();
	$hour_sum = 0;
	$min_sum = 0;
    }
    $day_last = $day;
    $month_last = $month;
    $time_in = $_[2];
    $time_out = $_[3];
    split (/:/, $time_in);
    $hour_in = $_[0];
    $minute_in = $_[1];
    if ($time_out) {
	split (/:/, $time_out);
	$hour_out = $_[0];
	$minute_out = $_[1];
	$dmin = $minute_out - $minute_in;
	if ($dmin < 0) {
	    $dmin += 60;
	    $hour_out -= 1;
	}
	$dhr = $hour_out - $hour_in;
	if ($dhr < 0) {
	    $dhr += 24;
	}
	#print "$dhr $dmin\n";
    } else {
	$dhr = 0;
	$dmin = 0;
    }
    $hour_sum += $dhr;
    $min_sum += $dmin;
}
write_day_summary();
exit;

sub write_day_summary {
    $hour_sum += int($min_sum/60);
    $min_sum = $min_sum % 60;
    print "$month_last/$day_last $hour_sum:$min_sum\n";
    return;
}
