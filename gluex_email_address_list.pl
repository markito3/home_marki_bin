#!/usr/bin/env perl
use CGI;
use DBI;
# connect to database
$user = "gluex";
$password = "";
$database = "gluexContactList";
$hostname = "clasdb.jlab.org";
$dbh = DBI->connect("DBI:mysql:$database:$hostname", $user, $password);

$sql = "select nameFirst, nameLast, email from person where email != ' ';";
make_query($dbh, \$sth);

while ($row = $sth->fetchrow_hashref) {
    print "$row->{nameFirst},$row->{nameLast},$row->{nameFirst} $row->{nameLast},,$row->{email}\n";
}

exit;
#
# make a query
#
sub make_query {    

    my($dbh, $sth_ref) = @_;
    $$sth_ref = $dbh->prepare($sql)
        or die "Can't prepare $sql: $dbh->errstr\n";
    
    $rv = $$sth_ref->execute
        or die "Can't execute the query $sql\n error: $sth->errstr\n";
    
    return 0;
}
