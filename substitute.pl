#!/usr/bin/perl
while (<STDIN>) {
    s/$ARGV[0]/$ARGV[1]/g;
    print;
}
