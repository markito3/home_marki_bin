#!/usr/local/bin/perl
#
# Surveys the cache disk. If the sum of sizes of files marked for
# early deletion is not large enough, finds directories that are over
# quota and marks files for early deletion. Starts with the files that
# are newest by access time. Requires that the file has been
# unaccessed for a certain amount of time. Stops when the total size
# of the unmarked files is below quota.
#
# Uses a MySQL database to manage the data. Starts by creating a
# database table of all files on the disk, storing their partition,
# path, file name, size and access age.
#
# $Id: cache_db.pl,v 1.26 2001/01/30 14:04:05 marki Exp $
########################################################################

use DBI;

$atime_marked = 100; # age cut: files older than this are considered
                     #          marked for deletion

$size_marked_min = 20e9; # in bytes, size of marked files less than
                         # this triggers quota checking

$atime_stable = 5.0/24.0/60.0; # age in days before file considered for
                                   # deletion

# list of cache partitions to consider
$cache_partition[0] = "/w/cache702";
$cache_partition[1] = "/w/cache703";
$cache_partition[2] = "/w/cache802";
$cache_partition[3] = "/w/cache803";
$cache_partition[4] = "/w/cache1001";
$cache_partition[5] = "/w/cache1002";

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

# construct the SQL query to drop the pre-existing version of the database

$sql  = "DROP TABLE IF EXISTS CacheFile";

# prepare and execute the query 

&DO_IT();

# create the cache file table

$sql  = "CREATE TABLE CacheFile (fileId int auto_increment PRIMARY KEY";
$sql .= ", partition int";
$sql .= ", path varchar(255)";
$sql .= ", name varchar(255)";
$sql .= ", size int";
$sql .= ", atime float(10,5)";
$sql .= ")";

&DO_IT();

# loop over cache partitions, populating the database table

$ic = 0;

foreach $cache (@cache_partition) {

    $ic++;
    
    open(FIND, "find $cache/ -type f |");
    
    while ($file = <FIND>) {
	#print "$file";
	chop $file;
	if ($file !~ /ha|c_temp/) {
	    $file_temp = $file;
	    $file_temp =~ s/$cache//;
	    @dirnames = split(/\//, $file_temp);
	    #print "#dirnames=$#dirnames\n";
	    $file_no_path = $dirnames[$#dirnames];
	    $path = '';
	    for ($i = 1; $i < $#dirnames; $i++) {
		$dir = $dirnames[$i];
		#print "dir=$dir\n";
		$path .= '/' . $dir;
	    }
	    $size = -s $file;
	    $atime = -A $file;
	    #print "path=$path file_no_path=$file_no_path\n";
	    
	    $sql = "INSERT INTO CacheFile (partition, path, name, size, atime)"
		. " VALUES ($ic, \"$path\", \"$file_no_path\", \"$size\","
		    . " \"$atime\")";
	    &DO_IT();
	}
    }
    
    close (FIND);
    
}

# find the summed size of files marked for early deletion

$sql = "SELECT SUM(size) from CacheFile where atime > $atime_marked"; &DO_IT();
$size_marked = $sth->fetchrow;
$size_marked_gb = $size_marked/1e9;

# find the age of oldest file not marked for early deletion

$sql = "SELECT MAX(atime) from CacheFile where atime < $atime_marked";
&DO_IT();
$latency = $sth->fetchrow;

open (LOG, ">> /scratch/cache_db.log");
$date_now = `date`;
print LOG "date=$date_now size_marked=$size_marked_gb GB, latency=$latency days\n";

# if not enough space is marked for deletion and latency low, check quotas

if ($size_marked < $size_marked_min) {

# set quota based on current latency

    if ($latency < 4.0) {
	$quota = 150e9; # in bytes
    } elsif ($latency < 7.0) {
	$quota = 300e9;
    } else {
	$quota = 10e12;
    }
    $quota_gb = $quota/1.0e9;
    print LOG "quota=$quota_gb GB\n";

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
	$size_sum_gb = $size_sum/1.0e9;
	$quota_diff_gb = $quota_diff/1.0e9;
	if ($quota_diff > 0) {
	    write LOG;
	    $amount_over{$path_target} = $quota_diff;
	}
    }

#   loop over paths again. start deleting files from those over quota.
#   stop when over-quota amount is reached.
    
    foreach $path_over (@path_active) {
	if ($amount_over{$path_over}) {
	    $amt_over_gb = $amount_over{$path_over}/1.0e9;
	    $sql = "SELECT partition, name, size, atime from CacheFile"
		. " where path=\"$path_over\" and atime < $atime_marked"
		    . " ORDER BY atime"; &DO_IT();
	    $size_sum_delete = 0;
	    while ((@row_ary = $sth->fetchrow_array)
		   && $size_sum_delete < $amount_over{$path_over}) {
		$ip = $row_ary[0];
		$name = @row_ary[1];
		$size = @row_ary[2];
		$atime = @row_ary[3];
		#print "ip=$ip name=$name size=$size atime=$atime ", "size_sum_delete=$size_sum_delete\n";
		if ($atime > $atime_stable) {
		    $size_sum_delete += $size;
		    $command = "jcache -d /cache$path_over/$name";
		    # for debugging, overwrite command with something innocuous
		    # $command = "";
		    print LOG "marking /cache$path_over/$name, atime=$atime\n";
		    system($command);
		}
	    }
	}
    }
}

close (LOG);

exit 0;

sub DO_IT {    

    $sth = $dbh->prepare($sql)
	or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $sth->execute
	or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}

format LOG_TOP =
 Size     Over   Directory
------- -------- ---------
.


format LOG =
@##.### @###.### @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$size_sum_gb, $quota_diff_gb, $path_target
.
