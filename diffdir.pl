#!/usr/bin/env perl
$dir1 = $ARGV[0];
$dir2 = $ARGV[1];
open(FIND1, "find $dir1 -maxdepth 1 -type f |");
while (<FIND1>) {
    print;
    chomp;
    @token = split(/\//);
    $file = $token[$#token];
    print "================$file=================\n";
    system ("diff -s $dir1/$file $dir2/$file");
}
exit;

