#!/usr/local/bin/perl
$sum = 0;
while ($line = <STDIN>) {
    print $line;
    chop $line;
    @column = split(/\s+/, $line);
    $sum += $column[$ARGV[0]];
    print "item=$column[$ARGV[0]] sum=$sum\n";
}
print "$sum\n";
exit 0;
