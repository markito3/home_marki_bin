#!/usr/local/bin/perl
$access_time_min = 4.0;
#$workdisk[0] = "/w/work501/staylor/.";
#$workdisk[1] = "/w/work601/fklein/.";
$workdisk[0] = "/w/work501/.";
$workdisk[1] = "/w/work601/.";
$iwd = 0;
while ($workdisk[$iwd]) {
    undef %file_array;
    undef %size_array;
    $size_sum = 0;
    $target = 10000000000;
    open(FIND, "find $workdisk[$iwd] -type f |");
    while ($file = <FIND>) {
	chop $file;
	$access_time = -A $file;
	if ($access_time > $access_time_min) {
	    #print "$access_time $file\n";
	    open(LS, "ls -l $file |");
	    $ls_output = <LS>;
	    @field = split(/\s+/, $ls_output);
	    $size = $field[4];
	    #print "$size\n";
	    $size_array{$file} = $size;
	    $file_array{$access_time} .= $file . '&';
	}
    }
    print "arrays\n";
    fileloop: foreach $access_time (reverse sort numerically keys(%file_array)) {
	print "access_time = $access_time\n";
	print "file = $file_array{$access_time}\n";
	@files = split(/&/, $file_array{$access_time});
	foreach $file (@files) {
	    $size = $size_array{$file};
	    $size_sum += $size;
	    print "$file $size $size_sum $target\n";
	    last fileloop if $size_sum > $target;
	}
    }
    $iwd++;
}
exit 0;

sub numerically {$a <=> $b;}
