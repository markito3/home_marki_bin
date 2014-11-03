#!/usr/bin/env perl
while (<>) {
    $string = $_;
    $string =~ s/ /\\ /g;
    $string =~ s/\(/\\\(/g;
    $string =~ s/\)/\\\)/g;
    $string =~ s/\'/\\\'/g;
    $string =~ s/\&/\\\&/g;
    $string =~ s/\"/\\\"/g;
    $string =~ s/\$/\\\$/g;
    print "$string";
}
