#!/usr/bin/env perl
$uname = `uname`;
chomp $uname;
if ($uname eq 'Linux') {
    if (-e '/etc/fedora-release') {
	$release_string = `cat /etc/fedora-release`;
	if ($release_string =~ /^Fedora release 9.*/) {
	    $release = '_Fedora9';
	} elsif ($release_string =~ /^Fedora release 8.*/) {
	    $release = '_Fedora8';
	} elsif ($release_string =~ /^Fedora release 7.*/) {
	    $release = '_Fedora7';
	} else {
	    print STDERR "unrecognized Fedora release\n";
	    $release = '_Fedora';
	}
    } elsif (-e '/etc/redhat-release') {
	$release_string = `cat /etc/redhat-release`;
	if ($release_string =~ /^Red Hat Enterprise Linux WS release 3.*/) {
	    $release = '_RHEL3';
	} elsif ($release_string =~ /^Red Hat Enterprise Linux Client release 5.*/) {
	    $release = '_RHEL5';
	} else {
	    print STDERR "unrecognized Red Hat release\n";
	    $release = '_RH';
	}
    } else {
	$release = '';
    }
} elsif ($uname eq 'SunOS') {
    $release = '_' . `uname -r`;
    chomp $release;
} else {
    $release = '';
}
print "${uname}${release}\n";
exit;
