#!/usr/local/bin/perl
while (<>) {
    #print;
    if (/^Job / || /^Mon / || /^Tue / || /^Wed / || /^Thu / || /^Fri /
	|| /^Sat / || /^Sun /) {
	print $line;
	$line = $_;
    } elsif (/^                     /) {
	if (/^                     </) {s/</ </}
	s/^                     //;
	$line_continue = $_;
	chop $line;
	$line .= $line_continue;
    }
}
print $line;
exit 0;
# end of perl script
