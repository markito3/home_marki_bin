#!/usr/local/bin/perl
open (INPUT, "work_tot_sort.tmp");
$old_user = "";
$istat = &CLEAR_COUNTERS($nfile, $size_tot);
while ($line = <INPUT>) {
    #print $line;
    @field = split(/\s+/, $line);
    $user = $field[2];
    #print "user = $user\n";
    if ($user ne $old_user) {
	#print "new user\n";
	$istat = &PROCESS_OLD_USER($old_user, $nfile, $size_tot);
	$istat = &CLEAR_COUNTERS($nfile, $size_tot);
    }
    $nfile++;
    $size = $field[4];
    #print "size = $size\n";
    $size_tot = $size_tot + $size;
    #print "$nfile, $size_tot\n";
    $old_user = $user; 
}
$istat = &PROCESS_OLD_USER($old_user, $nfile, $size_tot);

sub PROCESS_OLD_USER {
    #print "processing old user\n";
    local($user, $nfile, $size_tot) = @_;
    print "$size_tot bytes owned by $user, in $nfile files\n";
    return 0;
}

sub CLEAR_COUNTERS {
    @_[0] = 0;
    @_[1] = 0;
    #print "clearing counters\n";
    return 0;
}
