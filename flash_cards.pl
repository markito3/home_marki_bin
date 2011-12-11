#! /usr/bin/env perl

use CGI qw/:standard/;

$title = "Flash Cards";
print header,
    start_html($title),
    "<ol>\n";


for ($i = 1; $i <= 20; $i++) {
    $card = get_a_card();
    print "<li> $card\n";
}

print "</ol></body></html>\n";
exit;

sub get_a_card() {
    $not_a_good_card = 1;
    while ($not_a_good_card) {
	$n1 = get_a_number();
	$n2 = get_a_number();
	$operation = get_an_operation();
	if ($operation eq '+' || $operation eq '&times;') {
	    $op1 = $n1;
	    $op2 = $n2;
	} elsif ($operation eq '-') {
	    $op1 = $n1 + $n2;
	    $op2 = $n1;
	} elsif ($operation eq '&divide;') {
	    $op1 = $n1 * $n2;
	    $op2 = $n1;
	} else {
	    die "bad operation";
	}
	if (
	    $operation eq '+'
	    || $operation eq '-'
	    || $operation eq '&times;'
	    || $operation eq '&divide;' && $n1 != 0
	    ) {
	    $not_a_good_card = 0;
	}
    }
    my $card =  "$op1 $operation $op2";
    return $card;
}

sub get_a_number {
    $max = 10;
    $ranno = rand($max);
    $result = int($ranno);
    return $result;
}

sub get_an_operation {
    @operations = ('+', '-', '&times;', '&divide;');
    $max = 6.0;
    $ranno = rand($max);
    #print "ranno = $ranno ";
    if ($ranno < 1.0) {
	$index = 0;
    } elsif (1.0 <= $ranno && $ranno < 2.0) {
	$index = 1;
    } elsif (2.0 <= $ranno && $ranno < 4.0) {
	$index = 2;
    } else {
	$index = 3;
    }
    #print "index = $index ";
    #print "return = $operations[$index] ";
    return $operations[$index];
}
