#!/usr/local/bin/perl
#
# $Id: cache_use.pl,v 1.3 2000/07/12 18:54:51 marki Exp $
########################################################################

use DBI;

$quota = 150e9; # in bytes

$atime_marked = 100; # age cut: files older than this are considered
                     #          marked for deletion

$size_marked_min = 20e9; # in bytes, size of marked files less than
                         # this triggers quota checking

# list of cache partitions to consider
$cache_partition[0] = "/w/cache101";
$cache_partition[1] = "/w/cache201";
$cache_partition[2] = "/w/cache401";

# connect to MySQL database on localhost

$user = "root";
$password = "";
$hostname = "localhost";

$dbh = DBI->connect("DBI:mysql:cache:$hostname", $user, $password);

if (defined $dbh) {
    #print "Connection successful: handle: $dbh\n";
} else {
    die "Could not make database connect...yuz got problems...\n";
}

# find the summed size of files marked for early deletion

$sql = "SELECT SUM(size) from CacheFile where atime > $atime_marked"; &DO_IT();
$size_marked = $sth->fetchrow;

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

$size_marked_gb = $size_marked/1e9;
print "Total marked for early deletion: $size_marked_gb GB\n";

exit;

sub DO_IT {    

    $sth = $dbh->prepare($sql)
	or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $sth->execute
	or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}

format STDOUT_TOP =
 Size    Amount
 (GB)     Over   Directory
------- -------- ---------
.


format =
@##.### @###.### @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$size_sum_gb, $quota_diff_gb, $path_target
.
