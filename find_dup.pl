#!/usr/bin/env perl
$i = 0;
while (<>) {
    chomp;
    if (/\S/) {
	$line[$i] = $_;
	$i++;
    }
}
$n = $i;
print "$n = lines - 1\n";
for ($i = 0; $i < $n - 1; $i++) {
    for ($j = $i + 1; $j < $n; $j++) {
#	    print "$i $j $line[$i] $line[$j]\n";
	if ($line[$i] eq $line[$j]) {
	    print "$i $j $line[$i]\n";
	}
    }
}
exit;
