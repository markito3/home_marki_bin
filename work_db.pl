#!/usr/bin/env perl
#
# $Id: work_db.pl,v 1.4 2001/10/11 20:20:30 marki Exp $
########################################################################

use DBI;

# get command line parameters
eval "\$$1=\$2" while $ARGV[0] =~ /^(\w+)=(.*)/ && shift; # see camel book

# list of work partitions to consider
$work_partition[0] = "/work/clas/disk1";
$work_partition[1] = "/work/clas/disk2";
$work_partition[2] = "/work/clas/disk3";
$work_partition[3] = "/work/clas/farm_output";

# connect to MySQL database on localhost

$user = "clasuser";
$password = "";
$hostname = "localhost";

$dbh = DBI->connect("DBI:mysql:cache:$hostname", $user, $password);

if (defined $dbh) {
    #print "Connection successful: handle: $dbh\n";
} else {
    die "Could not connect to database. Exiting.\n";
}

if (!$nodbmake) {
    MAKE_DB();
}

$sql = "SELECT uid, sum(size) AS sum_size, count(*) FROM WorkFile GROUP BY uid ORDER BY sum_size DESC";
DO_IT(\$sth);
while (($uid, $size, $count) = $sth->fetchrow_array) {
    $user = getpwuid($uid);
    $sizeg = $size/1.e9;
    foreach $ip (0 .. $#work_partition) {
	$sizep[$ip] = 0;
	$countp[$ip] = 0;
    }
    $sql = "SELECT partition, sum(size), count(*) FROM WorkFile WHERE uid=$uid GROUP BY partition ORDER BY partition";
    DO_IT(\$sthp);
    while (($partition, $sizep, $countp) = $sthp->fetchrow_array) {
	$sizep[$partition - 1] = $sizep;
	$countp[$partition - 1] = $countp;
    }
    foreach $ip (0 .. $#work_partition) {
	$sizepg[$ip] = $sizep[$ip]/1.e9;
    }
    write
}

format STDOUT_TOP =
          all work disks       disk1           disk2           disk3       farm_output
user      Gbytes   files  Gbytes   files  Gbytes   files  Gbytes   files  Gbytes   files
----      --------------  --------------  --------------  --------------  --------------
.
format =
@<<<<<<<  @##.###  @####  @##.###  @####  @##.###  @####  @##.###  @####  @##.###  @####
$user, $sizeg, $count, $sizepg[0], $countp[0], $sizepg[1], $countp[1], $sizepg[2], $countp[2], $sizepg[3], $countp[3]
.

exit 0;

sub MAKE_DB {


# construct the SQL query to drop the pre-existing version of the database

    $sql  = "DROP TABLE IF EXISTS WorkFile";

# prepare and execute the query 

    &DO_IT();

# create the cache file table

    $sql  = "CREATE TABLE WorkFile (fileId int auto_increment PRIMARY KEY";
    $sql .= ", partition int";
    $sql .= ", path varchar(255)";
    $sql .= ", name varchar(255)";
    $sql .= ", size int";
    $sql .= ", atime float(10,5)";
    $sql .= ", uid int";
    $sql .= ")";

    &DO_IT();

# loop over cache partitions, populating the database table

    $iw = 0;

    foreach $work (@work_partition) {
	
	$iw++;
    
	open(FIND, "find $work/ -type f |");
    
	while ($file = <FIND>) {
	    #print "$file";
	    chop $file;
	    $file_temp = $file;
	    $file_temp =~ s/$work//;
	    @dirnames = split(/\//, $file_temp);
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
	    ($dev, $ino, $mode, $nlink, $uid, $gid, $rdef, $size, $atime_epoch,
	     $mtime_epoch, $ctime, $blksize, $blocks) = stat($file);
	    #print "uid = $uid\n";
	    
	    $sql = "INSERT INTO WorkFile (partition, path, name, size, atime, uid)"
		. " VALUES ($iw, \"$path\", \"$file_no_path\", \"$size\","
		    . " \"$atime\", \"$uid\")";
	    &DO_IT();
	}
	
	close (FIND);
	
    }
    
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