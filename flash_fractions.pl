#! /usr/bin/env perl

use CGI qw/:standard/;

$title = "Flash Cards";
print header,
    start_html($title),
    "<ol>\n";


for ($i = 1; $i <= 5; $i++) {
    $card = get_a_card();
    print "<li> $card\n";
}

print "</ol></body></html>\n";
exit;

sub get_a_card() {
    $not_a_good_card = 1;
    while ($not_a_good_card) {
	$operation = get_an_operation();
	$n1 = get_a_number(7);
	$n2 = get_a_number(7);
	$n3 = get_a_number(7);
	$n4 = get_a_number(7);
	if ($operation eq '+') {
	    $op1 = "$n1/$n2";
	    $op2 = "$n3/$n4";
	} elsif ($operation eq '-') {
	    $op1 = "$n1/$n2";
	    $op2 = "$n3/$n4";
	    if ($n2 != 0 && $n4 != 0 && $n1/$n2 < $n3/$n4) {
		$temp = $op1;
		$op1 = $op2;
		$op2 = $temp;
		$temp = $n2;
		$n2 = $n4;
		$n4 = $temp;
	    }
	} elsif ($operation eq '&times;') {
	    $op1 = "$n1/$n2";
	    $op2 = "$n3/$n4";
	} elsif ($operation eq '&divide;') {
	    $op1 = "$n1/$n2";
	    $op2 = "$n3/$n4";
	} else {
	    die "bad operation";
	}
	if (
	    $n2 != 0
	    && $n4 !=0
	    && $n1 < $n2
	    && $n3 < $n4
	    && ltcheck($n1,$n2)
	    && ltcheck($n3,$n4)
	    && $n2 > 1
	    && $n4 > 1
	    ) {
	    $not_a_good_card = 0;
	}
    }
    my $card =  "$op1 $operation $op2";
    return $card;
}

sub ltcheck {
    my ($n1, $n2) = @_;
    $lt = 1;
    for (my $i = 2; $i <= 10; $i++) {
	if ($n1%$i == 0 && $n2%$i == 0) {$lt = 0;}	
#debug
#	$m1 = $n1%$i;
#	$m2 = $n2%$i;
#	print "$n1, $n2, $i, $m1, $m2, $lt \n";
    }
    return $lt;
}

sub get_a_number {
    my ($max) = @_;
    $ranno = rand($max + 1);
    $result = int($ranno);
    return $result;
}

sub get_an_operation {
    @operations = ('+', '-', '&times;', '&divide;');
    $max = 4.0;
    $ranno = rand($max);
    #print "ranno = $ranno ";
    if ($ranno < 1.0) {
	$index = 0;
    } elsif (1.0 <= $ranno && $ranno < 2.0) {
	$index = 1;
    } elsif (2.0 <= $ranno && $ranno < 3.0) {
	$index = 2;
    } else {
	$index = 3;
    }
    #print "index = $index ";
    #print "return = $operations[$index] ";
    # override, use addition
    $index = 0;
    return $operations[$index];
}
