#!/usr/local/bin/perl
$hostname = $ENV{'HOST'};
@field = split(/\./, $hostname);
print "$field[0]\n";
exit;
