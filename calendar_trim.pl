#! /usr/bin/perl
$arm = 0;
$arm_note = 0;
$il = 0;
while (<>) {
    if (/^Note/) {
	$arm_note = 1;
	$todo = 0;
	$done = 0;
    }
    if ($arm_note) {
	$line[$il++] = $_;
	if (/^Todo/) {$todo = 1;}
	if (/^Done/) {$done = 1;}
    }
    if ($arm_note && /^\]/) {
	if ($arm) {
	    $arm = 0;
	    $arm_note = 0;
	    if ($todo && !$done) {
		for ($i = 0; $i < $il; $i++) {print $line[$i];}
	    }
	    $il = 0;
	} else {
	    $arm = 1;
	}
    }
}
exit 0;
# end of perl script
