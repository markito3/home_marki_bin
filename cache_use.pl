#!/usr/local/bin/perl
#
# $Id: cache_use.pl,v 1.7 2001/03/29 16:46:38 marki Exp $
########################################################################

use DBI;

$quota = 200e9; # in bytes

$atime_marked = 100; # age cut: files older than this are considered
                     #          marked for deletion

# connect to MySQL database on localhost

$user = "clasuser";
$password = "";
$hostname = "localhost";

$dbh = DBI->connect("DBI:mysql:cache:$hostname", $user, $password);

if (defined $dbh) {
    #print "Connection successful: handle: $dbh\n";
} else {
    die "Could not make database connect...yuz got problems...\n";
}

#   make list of paths (directories) to consider

$sql = "SELECT DISTINCT path from CacheFile";
&DO_IT();

$npath = 0;
while (@row_ary = $sth->fetchrow_array) {
    $path_active[$npath++] = $row_ary[0];
}

#   find the disk usage of each path checking if it is over quota

foreach $path_target (@path_active) {
    $sql = "SELECT SUM(size) from CacheFile"
	. " where path=\"$path_target\" and atime < $atime_marked";
    &DO_IT();
    $size_sum = $sth->fetchrow;
    $quota_diff = $size_sum - $quota;
    if ($quota_diff <= 0) {$quota_diff = 0;}
    $size_sum_gb = $size_sum/1.0e9;
    $quota_diff_gb = $quota_diff/1.0e9;
    write;
}

print "Sizes do not include files marked for early deletion.\n";

# find the summed size of files marked for early deletion

$sql = "SELECT SUM(size) from CacheFile where atime > $atime_marked"; &DO_IT();
$size_marked = $sth->fetchrow;
$size_marked_gb = $size_marked/1e9;
print "Total marked for early deletion: $size_marked_gb GB\n";

# find age of oldest file not marked for deletion

$sql = "SELECT MAX(atime) from CacheFile where atime < $atime_marked";
&DO_IT();
$atime_oldest = $sth->fetchrow;
print "Age of oldest (unmarked) file: $atime_oldest days\n";

exit;

sub DO_IT {    

    $sth = $dbh->prepare($sql)
	or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $sth->execute
	or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}

format STDOUT_TOP =
           Amount
 Size       Over
 (GB)   3-day quota Directory
------- ----------- ---------
.


format =
@##.### @###.###    @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$size_sum_gb, $quota_diff_gb, $path_target
.
