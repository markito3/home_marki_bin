#!/usr/bin/perl -w

# Perl based passwd generation file, original to Richard Caley.
#
# This program prints the unencrypted password on standard output
# followed by the encrypted password.
#

$saltchars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789./';

while (<>) {
    chomp $_;

    my ($salt) = substr($saltchars, rand(64), 1) . substr($saltchars, rand(64), 1);
    my ($c) = crypt($_, $salt);
    print "'$_' => '$c'\n";
}
