#!/usr/bin/perl

format = 
@>> @>> @>> @>> @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$sum, $red, $green, $blue, $name
.

open (SHOWRGB, "showrgb |");

while($line = <SHOWRGB>) {
    #print $line;
    chop $line;
    while (substr($line, 0, 1) eq " ") {
	$line = substr($line, 1);
	#print "$line\n";
	#print "substr: /", substr($line, 0, 1), "/\n"
    }
    #print "$line\n";
    @field = split(/\s+/, $line);
    $red = $field[0];
    $green = $field[1];
    $blue = $field[2];
    $name = $field[3];
    if (!$field[4]) {
	$sum = $red + $green + $blue;
	#print "/$sum/$red/$green/$blue/$name/\n";
	write;
    }

}
