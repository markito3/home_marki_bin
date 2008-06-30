#!/usr/bin/env perl
$uname = `uname`;
chomp $uname;
if ($uname eq 'Linux') {
    if (-f '/etc/fedora-release') {
	$release_string = `cat /etc/fedora-release`;
	chomp $release_string;
	split(/\s+/, $release_string);
	$release = $_[0]. $_[2];
	print "${uname}_$release\n";
    } elsif (-f '/etc/redhat-release') {
	$release_string = `cat /etc/fedora-release`;
	if ($release_string =~ /^Red Hat Enterprise Linux WS release 3.*/) {
	    $release = 'RHEL3';
	} elsif ($release_string =~ /^Red Hat Enterprise Linux Client release 5.*/) {
	    $release = 'RHEL5';
	} else {
	    $release = 'RH';
	}
	print "${uname}_$release\n";
    } else {
	print "$uname\n";
    }
} elsif ($uname eq 'SunOS') {
    $release = `uname -r`;
    chomp $release;
    print "SunOS_$release\n";
} else {
    print "$uname\n";
}
