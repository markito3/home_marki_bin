#!/usr/local/bin/perl
$name_old = "";
while (<>) {
    chop;
    $name = $_;
    if ($name ne $name_old) {print "$name\n";}
    $name_old = $name;
}
exit;
