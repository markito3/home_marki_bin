#!/usr/bin/env perl
$dir1 = $ARGV[0];
$dir2 = $ARGV[1];
#print "debug: dir1 = $dir1, dir2 = $dir2\n";
$verbose = $ARGV[2];
open(FIND1, "find $dir1 -type f |");
while ($full = <FIND1>) {
    #print "debug: full = $full";
    chomp $full;
    @token = split(/\//, $full);
    #for ($i = 0; $i <= $#token; $i++) {print "token[$i] = $token[$i]\n";}
    $file = $token[$#token];
    #print "debug: file = $file\n";
    @token_base0 = split(/$dir1\//, $full);
    #for ($i = 0; $i <= $#token_base0; $i++) {print "token_base0[$i] = $token_base0[$i]\n";}
    $base0 = $token_base0[1];
    #print "debug: base0 = $base0\n";
    $file_escaped = $file;
    $file_escaped =~ s/\(/\\\(/g;
    $file_escaped =~ s/\)/\\\)/g;
    $file_escaped =~ s/\+/\\\+/g;
    #print "debug: file_escaped = $file_escaped\n";
    @token_base = split(/$file_escaped/, $base0);
    #for ($i = 0; $i <= $#token_base; $i++) {print "token_base[$i] = $token_base[$i]\n";}
    $base = $token_base[0];
    #print "debug: base = $base\n";
    if ($verbose) {print "================$base$file=================\n";}
    if ($verbose) {$options = "-s"} else {$options = '';}
    $file_escaped2 = $file_escaped;
    $file_escaped2 =~ s/ /\\ /g;
    $file_escaped2 =~ s/'/\\'/g;
    $file_escaped2 =~ s/&/\\&/g;
    $base_escaped = $base;
    $base_escaped =~ s/ /\\ /g;
    $base_escaped =~ s/'/\\'/g;
    $command = "diff $options $dir1/${base_escaped}$file_escaped2 $dir2/${base_escaped}$file_escaped2";
    if ($verbose) {print "$command\n";}
    system ("$command");
}
exit;

