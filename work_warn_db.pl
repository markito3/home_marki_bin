#!/usr/bin/env perl
#
# $Id: work_warn_db.pl,v 1.3 2001/10/24 13:20:34 marki Exp $
########################################################################

use DBI;

# get command line parameters
eval "\$$1=\$2" while $ARGV[0] =~ /^(\w+)=(.*)/ && shift; # see camel book

# list of work partitions to consider
$work_partition[0] = "/work/clas/disk1";
$work_partition[1] = "/work/clas/disk2";
$work_partition[2] = "/work/clas/disk3";

# connect to MySQL database on localhost

$user = "clasuser";
$password = "";
$hostname = "localhost";

$dbh = DBI->connect("DBI:mysql:cache:$hostname", $user, $password);

if (defined $dbh) {
    print "Connection successful: handle: $dbh\n";
} else {
    die "Could not connect to database. Exiting.\n";
}

foreach $ip (0 .. $#work_partition) {
    open(DF, "df $work_partition[$ip] |");
    $line = <DF>;
    $line = <DF>;
    @field = split(/\s+/, $line);
    if (!$#field) {
	$line = <DF>;
	@field = split(/\s+/, $line);
    }   
    $used = $field[2]; # kB
    $free = $field[3]; # kB
    $total = $used + $free; # kB
    close(DF);
    $dt = 1000*($used - 0.65*$total); # delete target in bytes
    if ($dt < 0) {$dt = 0;}
    print "$work_partition[$ip] $total $used $free $dt\n";
    $partno = $ip + 1;
    $sql = "SELECT size, atime FROM WorkFile WHERE partition = $partno AND atime > 5.0 ORDER BY atime DESC";
    DO_IT(\$sth);
    $sum = 0;
    while ($sum < $dt && (($size, $atime) = $sth->fetchrow_array)) {
	$sum += $size;
	#print "$atime $sum\n";
	$atime_last = $atime;
    }
    if ($dt) {
	$atime_cut[$ip] = $atime_last;
    } else {
	$atime_cut[$ip] = 365*100;
    }
    print "$atime_cut[$ip]\n";
}

$partition_clause = "partition = 1 AND atime > $atime_cut[0]";
for $ip (1 .. $#work_partition) {
    $partno = $ip + 1;
    $partition_clause .= " OR partition = $partno AND atime >= $atime_cut[$ip]"
}
$sql = "SELECT DISTINCT uid FROM WorkFile WHERE $partition_clause";
#print "$sql\n";
DO_IT(\$sth);
while ($uid = $sth->fetchrow) {
    $user = getpwuid($uid);
    print "$user\n";
    $sql = "SELECT DISTINCT partition, path FROM WorkFile WHERE uid = $uid AND ($partition_clause)";
    #print "$sql\n";
    DO_IT(\$sth_path);
    @pathlist = ();
    $np = 0;
    while (($partition, $path) = $sth_path->fetchrow_array) {
	$pathlist[$np++] = "$work_partition[$partition - 1]$path";
	print "$work_partition[$partition - 1]$path\n";
    }
    SEND_MAIL();
}

exit 0;

sub SEND_MAIL {
    open (MAIL, "| mail -s \"Your work disk files\" $user\@jlab.org marki\@jlab.org");
    print MAIL "You have files on the work disk that may be deleted during"
	. " the next two days.\nThey are in the following directories:\n\n";
    foreach $ip (0 .. $#pathlist) {
	print MAIL "  $pathlist[$ip]\n";
    }
    print MAIL "\n";
    print MAIL "You can find our work disk policy described in the Offline FAQ at\n";
    print MAIL "\n";
    print MAIL "  http://clasweb.jlab.org/offline/offline_faq/\n";
    print MAIL "\n";
    print MAIL "You can find a summary of your (and everyone else's) work disk usage\n";
    print MAIL "by going to\n";
    print MAIL "\n";
    print MAIL "  http://claspc2.jlab.org/~marki/doc/offline/resource_status.html\n";
    print MAIL "\n";
    print MAIL "and clicking on \"Auto-Managed Work Disk Usage\".\n";
    close (MAIL);
}

sub DO_IT {    

    my ($sthref) = @_;

    $$sthref = $dbh->prepare($sql)
	or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $$sthref->execute
	or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}

# end of perl script
