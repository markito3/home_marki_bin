#!/usr/local/bin/perl
$old_user = "";
$istat = &CLEAR_COUNTERS($nfile, $size_tot);
while ($line = <STDIN>) {
    #print $line;
    @field = split(/\s+/, $line);
    $user = $field[2];
    #print "user = $user\n";
    if ($user ne $old_user) {
	#print "new user=$user\n";
	if ($old_user ne "") {
	    $istat = &PROCESS_OLD_USER($old_user, $nfile, $size_tot);
	    $istat = &CLEAR_COUNTERS($nfile, $size_tot);
	}
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
    local($user, $nfile, $size_tot) = @_;
    #print "processing old user=$user\n";
    print "$size_tot bytes owned by $user, in $nfile files\n";
    return 0;
}

sub CLEAR_COUNTERS {
    @_[0] = 0;
    @_[1] = 0;
    #print "clearing counters\n";
    return 0;
}
