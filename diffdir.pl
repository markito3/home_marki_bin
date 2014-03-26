#!/usr/bin/env perl
$dir1 = $ARGV[0];
$dir2 = $ARGV[1];
open(FIND1, "find $dir1 -type f |");
while ($full = <FIND1>) {
    chomp $full;
    @token = split(/\//, $full);
    $file = $token[$#token];
    @token_base0 = split(/$dir1/, $full);
    $base0 = $token_base0[1];
    $file_for_split = $file;
    $file_for_split =~ s/\+/\\\+/g;
    $file_for_split =~ s/\./\\\./g;
    @token_base = split(/$file_for_split/, $base0);
    $base = $token_base[0];
    print "================$base/$file=================\n";
    system ("diff -s $dir1/$base/$file $dir2/$base/$file");
}
exit;

