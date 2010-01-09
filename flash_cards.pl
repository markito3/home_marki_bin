#! /usr/bin/env perl

for ($i = 1; $i <= 15; $i++) {
    $card = get_a_card();
    print "$i) $card\n";
}
exit;

sub get_a_card() {
    $not_a_good_card = 1;
    while ($not_a_good_card) {
	$n1 = get_a_number();
	$n2 = get_a_number();
	$operation = get_an_operation();
	if ($operation eq '+' || $operation eq 'X') {
	    $op1 = $n1;
	    $op2 = $n2;
	} elsif ($operation eq '-') {
	    $op1 = $n1 + $n2;
	    $op2 = $n1;
	} elsif ($operation eq '/') {
	    $op1 = $n1 * $n2;
	    $op2 = $n1;
	} else {
	    die "bad operation";
	}
	if (!($operation eq 'X' && ($op1 > 4 && $op2 > 4))) {$not_a_good_card = 0;}
    }
    my $card =  "$op1 $operation $op2";
    return $card;
}

sub get_a_number {
    $max = 9;
    $ranno = rand($max);
    $result = int($ranno);
    return $result;
}

sub get_an_operation {
    @operations = ('+', '-', 'X');
    $max = $#operations + 1;
    $ranno = rand($max);
    $index = int($ranno);
    return $operations[$index];
}
