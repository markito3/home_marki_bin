#!/usr/bin/env perl
$factor = $ARGV[0];
$counter = 0;
while (<STDIN>) {
    $counter++;
    if ($counter == $factor) {
	print;
	$counter = 0;
    }
}
exit;
