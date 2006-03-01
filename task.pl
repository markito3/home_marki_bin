#!/usr/bin/env perl
$intask = 0;
while (<>) {
    chop;
    chop;
    ($field, $value) = split/:/;
    split(/;/, $field);
    $field = $_[0];
    #print "field = $field, value = $value, intask = $intask\n";
    if ($field eq 'END' && $value eq 'VTODO') {
	#print "$PRIORITY/$STATUS/$SUMMARY\n";
	if ($STATUS ne 'COMPLETED') {
	    print "$PRIORITY \"$SUMMARY\"\n";
	}
	$intask = 0;
	$PRIORITY = 0;
	$STATUS = '';
	$SUMMARY = 'NULL';
    }
    if ($intask) {
	#print "\$$field = $value;\n";
	$$field = $value;
    }
    if ($field eq 'BEGIN' && $value eq 'VTODO') {
	$intask = 1;
    }
}

exit;
