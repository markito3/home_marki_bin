#!/usr/local/bin/perl
$passwd_file = $ARGV[0];
open (PASSWD, $passwd_file);
while (<PASSWD>) {
    split(/:/);
    $username = @_[0];
    $uid = @_[2];
    $gid = @_[3];
    print "$username $uid $gid\n";
    $id = `id $username`;
    $id =~ s/\(/=/g;
    split(/=/, $id);
    $uidid = @_[1];
    $gidid = @_[3];
    print "$uidid $gidid\n";
    if ($uid != $uidid) {print "no uid match\n";}
    if ($gid != $gidid) {print "no gid match\n";}
}
