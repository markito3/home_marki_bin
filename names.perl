#!/usr/local/bin/perl
$name_old = "";
while (<>) {
    @field = split(/\s+/);
    $name = $field[2];
    if ($name ne $name_old) {print "$name\n";}
    $name_old = $name;
}
exit;
