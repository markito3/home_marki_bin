#!/usr/bin/env perl
$program_name = $ARGV[0];
$delete_no_prompt = $ARGV[1];
$all_users = $ARGV[2];
$delete_silently = $ARGV[3];
#print "$program_name /$delete_no_prompt/ /$all_users/ /$delete_silently/\n";
if (!$program_name) {print "nothing to look for\n"; exit 1;}
$osname = $ENV{OSNAME};
if ($osname eq SunOS) {
    open (PS,"/usr/ucb/ps -g |");
} else {
    if ($all_users) {
	open (PS,"ps auxwww |");
    } else {
	open (PS,"ps uxwww |");
    }
}
$found = 0;
while (<PS>) {
    if (/$program_name/ && !/kproc\.pl/) {
	$found = 1;
	if (! $delete_silently) {print;}
	@field = split(/\s+/);
	$proc_id = $field[1];
	if ($delete_no_prompt) {
	    system("kill -9 $proc_id");
	} else {
	    print "kill process $proc_id? ";
	    $response = <STDIN>;
	    chop $response;
	    if ($response eq "y") {
		print "==> killing process $proc_id\n";
		system("kill -9 $proc_id");
	    }
	}
    }
}
if ($found) {
    exit 0;
} else {
    if (! $delete_silently) {print "nothing found to kill\n";}
    exit 2;
}
# end of perl script
