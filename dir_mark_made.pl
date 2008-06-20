#!/usr/bin/perl
$dir = $ARGV[0];
chomp $dir;
@partial = split(/\//, $dir);
$dirname = $partial[$#partial];
$marker_name = '.' . $dirname . "_marker";
system "rm -f $dir/$marker_name";
system "date > $dir/$marker_name";
exit 0;
