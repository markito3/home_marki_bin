#!/usr/local/bin/perl
$access_time_min = 4.0;
$free_fraction = 0.2;
$workdisk[0] = "/w/work501/.";
$workdisk[1] = "/w/work601/.";
$iwd = 0;
while ($workdisk[$iwd]) {
    $disk = $workdisk[$iwd];
    undef %file_array;
    undef %size_array;
    $size_sum = 0;
#
# calculate target to delete
#
    open(DF, "df -k $disk |");
    $line = <DF>;
    $line = <DF>;
    @field = split(/\s+/, $line);
    $size_tot = $field[1];
    $size_avail = $field[3];
    $size_delete_target = 1000*($free_fraction*$size_tot - $size_avail);
#
# survey the disk
#
    open(FIND, "find $disk -type f |");
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
#
# loop over the files, oldest first, listing them until target reached
#
    fileloop: foreach $access_time (reverse sort numerically keys(%file_array)) {
	#print "access_time = $access_time\n";
	#print "file = $file_array{$access_time}\n";
	@files = split(/&/, $file_array{$access_time});
	foreach $file (@files) {
	    $size = $size_array{$file};
	    $size_sum += $size;
	    #print "$file $size $size_sum $size_delete_target\n";
	    print "$file\n";
	    last fileloop if $size_sum > $size_delete_target;
	}
    }
    $iwd++;
}
exit 0;

sub numerically {$a <=> $b;}
