#!/usr/bin/env perl
# $Id: jobstat_filter.pl,v 1.6 2002/02/06 20:10:13 marki Exp $
while (<>) {
    if (/^Job /) {
	print "$job $jobname $user $project $status $queue $submit $start ",
	"$node $cpu\n";
	$line = $_;
	#print $line;
	$job = &PARSE($line, "Job");
	$jobname = &PARSE($line, "Job Name");
	$user = &PARSE($line, "User");
	$project = &PARSE($line, "Project");
	$status = &PARSE($line, "Status");
	$queue = &PARSE($line, "Queue");
	$submit = "";
	$start = "";
	$node = "";
	$cpu = "";
    } elsif (/^Mon / || /^Tue / || /^Wed / || /^Thu / || /^Fri / || /^Sat /
	     || /^Sun /) {
	$line = $_;
	$time = substr($line,4,12);
	#print "time = $time\n";
	if (/Submitted from host/) {
	    $submit = $time;
	    if ($status eq "PEND" && /Dependency Condition/) {
		$line = $_;
		$condition = &PARSE($line, "Dependency Condition");
		#print "dependency condition = $condition\n";
		$start = $condition; # use the dependency as the start time
	    }
	} elsif (/Started on/) {
	    $start = $time;
	    $node = &PARSE($line,"Started on");
	} elsif (/The CPU time used is/) {
	    @ary0 = split(/The CPU time used is /, $line);
	    @ary1 = split(/ seconds/, $ary0[1]);
	    $cpu = $ary1[0]/3600.0;
	}
    }
}
print "$job $jobname $user $project $status $queue $submit $start $node ",
    "$cpu\n";
exit 0;

sub PARSE {
    local ($line, $field) = @_;
    #print "PARSE: line = ${line}field = $field\n";
    @ary0 = split(/$field\s+</, $line);
    #print "ary0[1] = $ary0[1]\n";
    @ary1 = split(/>/, $ary0[1]);
    #print "ary1[0] = $ary1[0]\n";
    $token =  $ary1[0];
    #print "field = /$field/, token = /$token/\n";
    return $token;
}
# end of perl script
