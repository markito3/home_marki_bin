#!/usr/local/bin/perl
$disk = $ARGV[0];
open(INPUT, "find $disk/ -type f -atime +13 | file_sum.pl |");
$line = <INPUT>;
$stale = $line/1.e9;
close(INPUT);
open(INPUT, "df $disk |");
$line = <INPUT>;
$line = <INPUT>;
@field = split(/\s+/, $line);
$size = $field[1]/1.e6;
$used = $field[2]/1.e6;
$free = $field[3]/1.e6;
if ($ARGV[1]) {
    printf "%25s  %6s  %6s  %6s  %6s\n",
	("disk partition", "size", "used", "stale", "free");
}
printf "%25s  %6.1f  %6.1f  %6.1f  %6.1f\n", ($disk,$size,$used,$stale,$free);
exit
