#!/usr/bin/env perl
$dir = $ARGV[0];
open(FINDDIR, "find $dir -type d -name .svn |");
while ($dirname = <FINDDIR>) {
    print $dirname;
    @pathparts = split(/\/\.svn/, $dirname);
    $path = $pathparts[0];
    print "path = $path\n";
    lock_files_in_dir($path);
}
close (FINDIR);

sub lock_files_in_dir {
    my ($path) = @_;
    my $file;
    open (FINDFILES, "find $path -maxdepth 1 -type f |");
    while ($file = <FINDFILES>) {
	chomp $file;
	$status = `svn st $file`;
	chomp $status;
	if ($status) {
	    print "$file: non-blank status = $status\n";
	} else {
	    print "$file: attempting lock\n";
	    system "svn lock $file";
	}
    }
    close (FINDFILES);
}
