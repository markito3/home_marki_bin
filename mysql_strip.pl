#!/usr/bin/env perl
$write_flag = 1;
$look_for_next_db = 0;
while($line = <>) {
    if ($line =~ /-- Current Database/) {
	#print "--database-------> $line";
	if ($look_for_next_db) {
	    $write_flag = 1;
	    $look_for_next_db = 0;
	}
	elsif ($line =~ /\`mysql\`/) {
	    #print "--name match-------> $line";
	    $write_flag = 0;
	    $look_for_next_db = 1;
	}
    }
    if ($write_flag) {
	print $line;
    }
}
# end of perl script
