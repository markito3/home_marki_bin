#!/usr/local/bin/perl
#
# $Id: cache_db.pl,v 1.3 2000/06/22 13:55:31 marki Exp $
########################################################################

use DBI;

$quota = 150e9;
$cache_partition[0] = "/w/cache101";
$cache_partition[1] = "/w/cache201";

# connect to MySQL database on localhost

$user = "root";
$password = "";
$hostname = "localhost";

$dbh = DBI->connect("DBI:mysql:cache:$hostname", $user, $password);

if (defined $dbh) {
    print "Connection successful: handle: $dbh\n";
} else {
    die "Could not make database connect...yuz got problems...\n";
}


# construct the "calib" database information

# construct the SQL query

$sql  = "DROP TABLE IF EXISTS CacheFile";

# prepare and execute the query 

&DO_IT();

$sql  = "CREATE TABLE CacheFile (fileId int auto_increment PRIMARY KEY";
$sql .= ", partition int";
$sql .= ", path varchar(255)";
$sql .= ", name varchar(255)";
$sql .= ", size int";
$sql .= ", atime float(10,5)";
$sql .= ")";

&DO_IT();

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

$sql = "SELECT DISTINCT path from CacheFile";
&DO_IT();

$npath = 0;
while (@row_ary = $sth->fetchrow_array) {
    $path_active[$npath++] = $row_ary[0];
}

$sql = "SELECT MAX(atime) from CacheFile"; &DO_IT();
$atime_max = $sth->fetchrow;
print "atime_max=$atime_max\n";

if ($atime_max < 30) {

    foreach $path_target (@path_active) {
	$sql = "SELECT SUM(size) from CacheFile"
	    . " where path=\"$path_target\" and atime < 30";
	&DO_IT();
	$size_sum = $sth->fetchrow;
	$quota_diff = $size_sum - $quota;
	print "$path_target $size_sum $quota_diff\n";
	if ($quota_diff > 0) {
	    $amount_over{$path_target} = $quota_diff;
	}
    }
    
    foreach $path_over (@path_active) {
	if ($amount_over{$path_over}) {
	    print "$path_over $amount_over{$path_over}\n";
	    $sql = "SELECT partition, name, size from CacheFile"
		. " where path=\"$path_over\" and atime < 30"
		    . " ORDER BY atime DESC"; &DO_IT();
	    $size_sum_delete = 0;
	    while ((@row_ary = $sth->fetchrow_array)
		   && $size_sum_delete < $amount_over{$path_over}) {
		$ip = $row_ary[0];
		$name = @row_ary[1];
		$size = @row_ary[2];
		$size_sum_delete += $size;
		#print "ip=$ip name=$name size=$size size_sum_delete=$size_sum_delete\n";
		$command = "jcache -d /cache$path_over/$name";
		print "command=\"$command\"\n";
		#system($command);
	    }
	}
    }
}

exit;

sub DO_IT {    

    $sth = $dbh->prepare($sql)
	or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $sth->execute
	or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}
