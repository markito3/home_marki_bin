#!/usr/local/bin/perl
$target = $ARGV[0];
$replacement = $ARGV[1];
$file = $ARGV[2];
system("cp -p $file $file~");
open(ORIGINAL, "$file~");
open(EDITTED, ">$file");
while (<ORIGINAL>) {
    s/$target/$replacement/g;
    print EDITTED;
}
exit
