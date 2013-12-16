#!/usr/bin/env perl
$file_with_path = $ARGV[0];
$file_with_path =~ s/ /\\ /g;
@field = split(/\//, $file_with_path);
$file = $field[$#field];
$status = system "scp -P9001 $file_with_path localhost:/scratch/marki/lpdir/";
print "copy status = $status\n";
if ($status == 0) {
    $status = system "ssh -p9001 localhost lp -dhalldx1 -o sides=two-sided-long-edge \'/scratch/marki/lpdir/$file\'";
    print "lp status = $status\n";
}
exit;
