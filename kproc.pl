#!/usr/local/bin/perl
$program_name = $ARGV[0];
if (!$program_name) {print "nothing to look for\n"; exit 1;}
$osname = $ENV{OSNAME};
if ($osname eq SunOS) {
    open (PS,"/usr/ucb/ps -g |");
} else {
    open (PS,"ps uxwww |");
}
$found = 0;
while (<PS>) {
    if (/$program_name/ && !/kproc\.pl/) {
	$found = 1;
	print;
	@field = split(/\s+/);
	$proc_id = $field[1];
	print "kill process $proc_id? ";
	$response = <STDIN>;
	chop $response;
	if ($response eq "y") {
	    print "killing process $proc_id\n";
	    system("kill -9 $proc_id");
	}
    }
}
if ($found) {
    exit 0;
} else {
    print "nothing found to kill\n";
    exit 2;
}
# end of perl script
